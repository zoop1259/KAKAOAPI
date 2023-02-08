//
//  KarloModel.swift
//  KAKAOAPI
//
//  Created by 강대민 on 2023/02/08.
//

import Foundation

struct KarloModel: Codable {
    let images: [KarloImage]
    let id, modelVersion: String

    enum CodingKeys: String, CodingKey {
        case images, id
        case modelVersion = "model_version"
    }
}

// MARK: - Image
struct KarloImage: Codable {
    let id, image: String
    let nsfw: Bool
}

