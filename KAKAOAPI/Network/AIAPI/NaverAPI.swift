//
//  NaverAPI.swift
//  KAKAOAPI
//
//  Created by 강대민 on 2023/02/13.
//

import SwiftUI
import Alamofire
import SwiftyJSON

/*
 curl "https://openapi.naver.com/v1/papago/n2mt" \
 -H "Content-Type: application/x-www-form-urlencoded; charset=UTF-8" \
 -H "X-Naver-Client-Id: RGnYCe9_TblbN03AFJd4" \
 -H "X-Naver-Client-Secret: zx5jtHEoTi" \
 -d "source=ko&target=en&text=만나서 반갑습니다." -v
 */

func naverAPICall(_ text: String, completion: @escaping (String) -> Void) {
    let clientId = Bundle.main.naverKey
    let clientSecret = Bundle.main.naverSecretKey
    
    let url = "https://openapi.naver.com/v1/papago/n2mt"
    let headers: HTTPHeaders = ["Content-Type": "application/x-www-form-urlencoded; charset=UTF-8",
                                "X-Naver-Client-Id": clientId,
                                "X-Naver-Client-Secret": clientSecret
    ]
    
    let params = ["source": "ko",
                  "target": "en",
                  "text": text
    ]
    
    APIManager(url: url, parameters: params, headers: headers) { (data: Papago?, error) in
        guard let data = data else {               // ↑ 타입 지정
            print("error: \(error.debugDescription)")
            return
        }
        completion(data.message.result.translatedText)
        print("번역 문장 : \(data.message.result.translatedText)")
    }
    
    /* 단순히 응답만 받기.
     .responseString { response in
     switch response.result {
     case .success(let value):
     print(value)
     case .failure(let error):
     print("Error: \(error)")
     }
     }
     */
}

