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

func naverAPICall(_ text: String) {
  let clientId = Bundle.main.naverKey
  let clientSecret = Bundle.main.naverSecretKey
  
  let url = "https://openapi.naver.com/v1/papago/n2mt"
  let headers: HTTPHeaders = ["Content-Type": "application/x-www-form-urlencoded; charset=UTF-8",
                              "X-Naver-Client-Id": clientId,
                              "X-Naver-Client-Secret": clientSecret
  ]
  //나중에 toggle을 이용하여 변환할 param..
  var params = ["source": "en",
                "target": "ko",
                "text": text
  ]

  AF.request(url, method: .post, parameters: params, encoding: URLEncoding.default, headers: headers)
      .validate(statusCode: 200..<300)
      .responseDecodable(of: Papago.self) { response in
        switch response.result {
        case .success(let value):
          let responseJson = JSON(value) //SwiftyJSON을 쓰지않으면 이걸 사용하지 못한다.
          //print(responseJson)
          print(value.message.result.translatedText)
          
        case .failure(let error):
          print(error)
        }
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

