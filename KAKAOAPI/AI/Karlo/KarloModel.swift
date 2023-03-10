//
//  KarloModel.swift
//  KAKAOAPI
//
//  Created by 강대민 on 2023/02/08.
//

import SwiftUI

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
    let nsfw: Bool //부적절한 단어 포함이긴한데...
}
