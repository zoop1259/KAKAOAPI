//
//  KarloAPI.swift
//  KAKAOAPI
//
//  Created by 강대민 on 2023/02/08.
//

import Alamofire
import SwiftyJSON
import SwiftUI

let REST_API_KEY = "${REST_API_KEY}"

//이건 escaping을 사용해보자.
func t2i(text: String, batchSize: Int = 1, completion: @escaping (UIImage?) -> Void) {
    let headers: HTTPHeaders = [
        "Authorization": "KakaoAK \(REST_API_KEY)",
        "Content-Type": "application/json"
    ]
    
    let parameters: [String: Any] = [
        "prompt": [
            "text": text,
            "batch_size": batchSize
        ]
    ]
    
    AF.request("https://api.kakaobrain.com/v1/inference/karlo/t2i", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
        .validate()
        .responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
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
