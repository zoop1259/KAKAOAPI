//
//  APIKEY.swift
//  KAKAOAPI
//
//  Created by 강대민 on 2023/02/04.
//
import Foundation

extension Bundle {
  var apiKey: String {
      guard let file = self.path(forResource: "Info", ofType: "plist") else { return "" }
      guard let resource = NSDictionary(contentsOfFile: file) else { return ""}
      guard let key = resource["APIKey"] as? String else { fatalError("apikey를 확인해주세요.")}
      return key
  }
  
  var naverKey: String {
      guard let file = self.path(forResource: "Info", ofType: "plist") else { return "" }
      guard let resource = NSDictionary(contentsOfFile: file) else { return ""}
      guard let key = resource["ClientID"] as? String else { fatalError("apikey를 확인해주세요.")}
      return key
  }
  
  var naverSecretKey: String {
      guard let file = self.path(forResource: "Info", ofType: "plist") else { return "" }
      guard let resource = NSDictionary(contentsOfFile: file) else { return ""}
      guard let key = resource["ClientSecret"] as? String else { fatalError("apikey를 확인해주세요.")}
      return key
  }
  
}
