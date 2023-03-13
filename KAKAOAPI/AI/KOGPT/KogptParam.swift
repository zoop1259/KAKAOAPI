//
//  KogptParam.swift
//  KAKAOAPI
//
//  Created by 강대민 on 2023/02/14.
//

import Foundation

class KogptParam: ObservableObject {
    @Published var prompt: String
    @Published var max_tokens: Int
    @Published var temperature: Double
    @Published var top_p: Double
    @Published var n: Int
    
    init(model: KogptParamModel = KogptParamModel()) {
        self.prompt = model.prompt
        self.max_tokens = model.max_tokens
        self.temperature = model.temperature
        self.top_p = model.top_p
        self.n = model.n
    }
}


//class KogptParam: ObservableObject {
//    @Published var prompt: String = "hi"
//    @Published var max_tokens: Int = 10
//    @Published var temperature: Double = 0.7
//    @Published var top_p: Double = 1.0
//    @Published var n: Int = 5
//}

//이게 뷰모델이 되는거다.
//class KogptParam: ObservableObject {
//    @Published var prompt: String
//    @Published var max_tokens: Int
//    @Published var temperature: Double
//    @Published var top_p: Double
//    @Published var n: Int
//
//    func update(with model: KogptParamModel) { //이제보니 init이 아니잖아?
//        self.prompt = model.prompt
//        self.max_tokens = model.max_tokens
//        self.temperature = model.temperature
//        self.top_p = model.top_p
//        self.n = model.n
//    }
//}

/*
 1번 코드는 KogptParam 클래스에 초기화 메서드가 없으므로 인스턴스 생성 시 프로퍼티의 초기값을 직접 설정해주어야 합니다. 따라서, 이 경우 update 메서드를 사용하여 인스턴스 생성 후에 프로퍼티 값을 업데이트해야 합니다.

 2번 코드에서는 init 메서드를 사용하여 KogptParamModel 객체를 전달할 수 있습니다. 이를 통해 KogptParam 클래스의 프로퍼티를 초기화할 수 있습니다. init 메서드의 매개변수로 model을 지정하고, 기본값으로 KogptParamModel()을 전달하면 초기값을 설정한 KogptParamModel의 객체가 사용됩니다.

 따라서, 2번 코드에서는 인스턴스 생성 시 init 메서드를 사용하여 프로퍼티 값을 초기화할 수 있으므로, update 메서드를 사용하지 않아도 됩니다.
 */
