//
//  KogptParamModel.swift
//  KAKAOAPI
//
//  Created by 강대민 on 2023/03/10.
//

import Foundation

struct KogptParamModel {
    var prompt: String
    var max_tokens: Int
    var temperature: Double
    var top_p: Double
    var n: Int
}
