//
//  NaverTranslate.swift
//  KAKAOAPI
//
//  Created by 강대민 on 2023/02/08.
//

import Foundation

// MARK: - Welcome
struct Papago: Codable {
    let message: Message
}

struct Papagos<T> where T : Decodable {
// T can be ANY type, Integer, boolean, String, Movies as long at the type is Decodable
  let message: Message
}

// MARK: - Message
struct Message: Codable {
    let result: Result
}

// MARK: - Result
struct Result: Codable {
    let translatedText: String
}
