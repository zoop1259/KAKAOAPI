//
//  KOGPTAPI.swift
//  KAKAOAPI
//
//  Created by 강대민 on 2023/02/04.
//

import Foundation
import Alamofire
import SwiftyJSON


/*
 prompt      : String : 제시어 (내가 입력할 글)
 max_tokens  : Integer : 최대 토큰수 (각 결과마다 생성될 글자 수)
 temperature : Double : 온도 설정 0~1 수치가 높을수록 창의적인 결과가 생성됨 (default값 1)
 top_p       : Double : 상위 확률 설정 0~1 수치가 높을수록 창의적인 결과가 생성됨 (default값 1)
 n           : Integer : 생성할 결과 수 1~16 (기본값 1)
 
 */
//func kogpt_api(prompt: String, max_tokens: Int = 50, temperature: Float = 1.0, top_p: Float = 1.0, n: Int = 5) {
//    
//    let apiKey = Bundle.main.apiKey
//    
//    let parameters:[String: Any] = [
//        "prompt": prompt,
//        "max_tokens": max_tokens,
//        "temperature": temperature,
//        "top_p": top_p,
//        "n": n
//    ]
//    
//    let headers: HTTPHeaders = [
//        "Authorization": "KakaoAK " + apiKey,
//        "Content-Type": "application/json"
//    ]
//    
//    AF.request("https://api.kakaobrain.com/v1/inference/kogpt/generation",
//               method: .post,
//               parameters: parameters,
//               encoding: JSONEncoding.default,
//               //headers: headers).responseJSON { response in //'responseJSON(queue:dataPreprocessor:emptyResponseCodes:emptyRequestMethods:options:completionHandler:)' is deprecated: responseJSON deprecated and will be removed in Alamofire 6. Use responseDecodable instead.
//               headers: headers).responseDecodable(of: JSON.self) { response in
//        switch response.result {
//        case .success(let value):
//            let responseJson = JSON(value) //SwiftyJSON을 쓰지않으면 이걸 사용하지 못한다.
//            print(responseJson)
//        case .failure(let error):
//            print(error)
//        }
//    }
//}


class KOGPTAPI: ObservableObject {
    @Published var kogptModel: [KOGPTModel] = []
    
    
    
//    func kogpt_api(prompt: String, max_tokens: Int = 50, temperature: Float = 1.0, top_p: Float = 1.0, n: Int = 5) {
    func kogpt_api(prompt: String, max_tokens: Int, temperature: Double, top_p: Double, n: Int) {
        print("https://api.kakaobrain.com/v1/inference/kogpt/generation", prompt)
        
        let apiKey = Bundle.main.apiKey
        
        let parameters:[String: Any] = [
            "prompt": prompt,
            "max_tokens": max_tokens,
            "temperature": temperature,
            "top_p": top_p,
            "n": n
        ]
        
        let headers: HTTPHeaders = [
            "Authorization": "KakaoAK " + apiKey,
            "Content-Type": "application/json"
        ]
        
    
        
        AF.request("https://api.kakaobrain.com/v1/inference/kogpt/generation",
                   method: .post,
                   parameters: parameters,
//      encoding: URLEncoding.default,
                   encoding: JSONEncoding.default,
//                   headers: headers).responseJSON { response in //'responseJSON(queue:dataPreprocessor:emptyResponseCodes:emptyRequestMethods:options:completionHandler:)' is deprecated: responseJSON deprecated and will be removed in Alamofire 6. Use responseDecodable instead.
//                   headers: headers).responseDecodable(of: JSON.self) { response in
                   headers: headers).responseDecodable(of: KOGPTModel.self) { response in
            print("응답 : \(response)")
            switch response.result {
                
            case .success(let value):
//                let responseJson = JSON(value) //SwiftyJSON을 쓰지않으면 이걸 사용하지 못한다.
//                print(responseJson)
                self.kogptModel = [value]
//                self.kogptModel.append(value)
                print(self.kogptModel)
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    //MVVM패턴 사용하면?
    func kogptMVVMAPI(with paramModel: KogptParamModel) {
        print("https://api.kakaobrain.com/v1/inference/kogpt/generation", paramModel.prompt)
        
        let apiKey = Bundle.main.apiKey
        
        let parameters:[String: Any] = [
            "prompt": paramModel.prompt,
            "max_tokens": paramModel.max_tokens,
            "temperature": paramModel.temperature,
            "top_p": paramModel.top_p,
            "n": paramModel.n
        ]
        
        let headers: HTTPHeaders = [
            "Authorization": "KakaoAK " + apiKey,
            "Content-Type": "application/json"
        ]
        
        AF.request("https://api.kakaobrain.com/v1/inference/kogpt/generation",
                   method: .post,
                   parameters: parameters,
                   encoding: JSONEncoding.default,
                   headers: headers).responseDecodable(of: KOGPTModel.self) { response in
            switch response.result {
            case .success(let value):
                print("이렇게 수정된건 호출되면?  \(self.kogptModel)")
            case .failure(let error):
                print(error)
            }
        }
    }
}
