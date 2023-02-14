//
//  APIGeneric.swift
//  KAKAOAPI
//
//  Created by 강대민 on 2023/02/14.
//

import Foundation
import Alamofire
import SwiftyJSON

func APICalled <T: Decodable> (_ text: String, url: String, parameters: [String: Any], headers: [String: String], completion: @escaping (Swift.Result<T, AFError>) -> Void) {
    AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: HTTPHeaders(headers))
        .validate()
        .responseDecodable(of: T.self) { response in
            switch response.result {
            case .success(let value):
                completion(.success(value))
            case .failure(let error):
                completion(.failure(error))
            }
        }
}

/*
 func karlo_api(text: String, batchSize: Int = 1, completion: @escaping (UIImage?) -> Void) {
   let karloapi = KarloAPI()
   let karloModel = karloapi.karloModel
   
   let apiKey = Bundle.main.apiKey
   
   let headers: HTTPHeaders = [
     "Authorization": "KakaoAK \(apiKey)",
     "Content-Type": "application/json"
   ]
   
   let parameters: [String: Any] = [
     "prompt": [
       "text": text,
       "batch_size": batchSize
     ]
   ]
   
   AF.request("https://api.kakaobrain.com/v1/inference/karlo/t2i",
              method: .post,
              parameters: parameters,
              encoding: JSONEncoding.default,
              headers: headers)
     .validate() //이게 허용범위를 정하기 위한것. .validate(200.<300) // 200~300사이 상태 코드만 허용.
 //    .responseJSON { response in
       .responseDecodable(of: JSON.self) { response in
       switch response.result {
       case .success(let value):
         let json = JSON(value)
         
         
         print(json)
         let base64Image = json["images"][0]["image"].stringValue
         if let data = Data(base64Encoded: base64Image, options: .ignoreUnknownCharacters) {
           completion(UIImage(data: data))
         } else {
           completion(nil)
         }
       case .failure(let error):
         print(error)
         completion(nil)
       }
     }
 }
 */