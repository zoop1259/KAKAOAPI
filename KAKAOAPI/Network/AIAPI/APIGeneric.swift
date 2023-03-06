//
//  APIGeneric.swift
//  KAKAOAPI
//
//  Created by 강대민 on 2023/02/14.
//

import Foundation
import Alamofire
import SwiftyJSON

enum APIError: Error {
    case invalidURL
    case responseError
    case parseError
    case decodeError
}

//단순한 형태의 api호출이라면 이것이 편하다.
func APIManager<T: Codable>(url: String, parameters: Parameters? = nil, headers: HTTPHeaders? = nil, completion: @escaping (_ data: T?, _ error: APIError?) -> Void) {
    guard let url = URL(string: url) else {
        completion(nil, .invalidURL)
        return
    }
    
    AF.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: headers)
        .validate()
        .responseDecodable(of: T.self) { response in
            switch response.result {
            case .success(let value):
                let responseJson = JSON(value) //SwiftyJSON을 쓰지않으면 이걸 사용하지 못한다.
                print("받아받아.",responseJson)
                completion(value, nil)
            case .failure(let error):
                if let data = response.data,
                   let responseJson = try? JSON(data: data) {
                    print("JSON response:", responseJson)
                }
                print("AF error:", error)
                completion(nil, .decodeError)
            }
        }
}

//func APICallManager<T: Codable>(url: String, parameters: [String: String], headers: HTTPHeaders, completion: @escaping (_ data: T?, _ error: String?) -> Void) {
func APICallManager<T: Codable>(url: String, parameters: [String: Any], headers: HTTPHeaders, completion: @escaping (_ data: T?, _ error: APIError?) -> Void) {
    guard let url = URL(string: url) else {
        completion(nil, .invalidURL)
        return
    }

  AF.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: headers)
        .validate()
        .responseJSON { response in
          
//          print(url)
//          print(headers)
//          print(parameters)
//          print(response)
          
            guard response.error == nil else {
                completion(nil, .responseError)
                return
            }
            
            guard let data = response.data else {
                completion(nil, .parseError)
                return
            }
            
            do {
                let result = try JSONDecoder().decode(T.self, from: data)
              completion(result, nil)
            } catch {
                completion(nil, .decodeError)
            }
        }
}

//복잡한 형태의 api는 이렇게 만들어야 한다.
func requestAndValidateJSON<T: Decodable>(_ url: String,
                                          method: HTTPMethod = .post,
                                          parameters: Parameters? = nil,
                                          headers: HTTPHeaders? = nil,
                                          decoder: JSONDecoder = JSONDecoder(),
                                          completion: @escaping (AFResult<T>) -> Void) {

    AF.request(url,
               method: method,
               parameters: parameters,
               encoding: JSONEncoding.default,
               headers: headers)
        .validate()
//        .responseJSON { response in
        .responseDecodable(of: T.self, decoder: decoder, completionHandler: { response in
            switch response.result {
            case .success:
                if let data = response.data {
                    do {
                        let decodedData = try decoder.decode(T.self, from: data)
                        completion(.success(decodedData))
                    } catch {
                        completion(.failure(AFError.responseSerializationFailed(reason: .decodingFailed(error: error))))
                    }
                } else {
                    completion(.failure(AFError.responseSerializationFailed(reason: .inputDataNilOrZeroLength)))
                }
            case .failure:
                completion(.failure(AFError.responseValidationFailed(reason: .unacceptableStatusCode(code: response.response?.statusCode ?? 400))))
            }
        })
}
