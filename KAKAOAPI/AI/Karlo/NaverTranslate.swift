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

// MARK: - Message
struct Message: Codable {
    let result: Result
}

// MARK: - Result
struct Result: Codable {
    let translatedText: String
}
