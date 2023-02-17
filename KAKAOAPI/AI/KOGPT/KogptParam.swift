//
//  KogptParam.swift
//  KAKAOAPI
//
//  Created by 강대민 on 2023/02/14.
//

import Foundation

class KogptParam: ObservableObject {
    @Published var prompt: String = "hi"
    @Published var max_tokens: Int = 10
    @Published var temperature: Double = 0.7
    @Published var top_p: Double = 1.0
    @Published var n: Int = 1
}

