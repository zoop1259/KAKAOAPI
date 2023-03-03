//
//  KarloAPI.swift
//  KAKAOAPI
//
//  Created by 강대민 on 2023/02/08.
//

import Alamofire
import SwiftyJSON
import SwiftUI

///KarloAPI 호출부분입니다.
/**
 
 - karlo_api
 
 입력받은 text를 통해 이미지를 번역합니다.
 
 - fetchImage는
 
 입력받은 text를 PapagoAPI를 통해 번역을 하고 번역한 값을 통해 karlo_api 메서드를 사용하여 image를 생성합니다.
 
 */

class KarloAPI: ObservableObject {
    @Published var image: UIImage?
    @ObservedObject private var karloParam = KarloParam()
    
    func karlo_api(text: String, batchSize: Int = 1, completion: @escaping (UIImage?) -> Void) {

        let apiKey = Bundle.main.apiKey
        
        let url = "https://api.kakaobrain.com/v1/inference/karlo/t2i"
        
        let headers: HTTPHeaders = [
            "Authorization": "KakaoAK \(apiKey)",
            "Content-Type": "application/json"
        ]
        
        let parameters: [String:Any] = [
            "prompt": [
                "text": text,
                "batch_size": batchSize
            ]
        ]
        
        requestAndValidateJSON(url, parameters: parameters, headers: headers) { (result: AFResult<KarloModel>) in
            print("성공이냐")
            switch result {
            case .success(let data):
                let base64Image = data.images[0].image
                if let data = Data(base64Encoded: base64Image, options: .ignoreUnknownCharacters) {
                    completion(UIImage(data: data))
                } else {
                    completion(nil)
                }
            case .failure(let error):
                print(error.localizedDescription)
                completion(nil)
            }
            
        }
    }
    
    func fetchImage(text: String, transalte: Bool = true) {
        if karloParam.translate {
            naverAPICall(text) { str in
                self.karlo_api(text: str) { image in
                    DispatchQueue.main.async {
                        self.image = image
                    }
                }
            }
        } else {
            self.karlo_api(text: text) { image in
                DispatchQueue.main.async {
                    self.image = image
                }
            }
        }
        

    }
}
