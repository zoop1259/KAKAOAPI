//
//  KOGPTModel.swift
//  KAKAOAPI
//
//  Created by 강대민 on 2023/02/07.
//

import SwiftUI

struct KOGPTModel: Codable {
    let generations: [Generation]
    let id: String
    let usage: Usage //토큰관련인데.. 사실 쓸일이 있을지는 모르겠다.
    
//    init(id: String, usage: Usage, generations: Generation) {
//        self.id = id
//        self.usage = usage
//        self.generations = [generations]
//    }
//
//    init () {
//        self.id = ""
//        self.usage = Usage(totalTokens: 0, generatedTokens: 0, promptTokens: 0)
//        self.generations = [Generation(text: "", tokens: 0)]
//    }
    
}

// MARK: - Generation
struct Generation: Codable {
    let text: String
    let tokens: Int
}

// MARK: - Usage
struct Usage: Codable {
    let totalTokens, generatedTokens, promptTokens: Int

    enum CodingKeys: String, CodingKey {
        case totalTokens = "total_tokens"
        case generatedTokens = "generated_tokens"
        case promptTokens = "prompt_tokens"
    }
}

//    KOGPTModel(id: 0, usage: Usage(total_tokens: 0, generated_tokens: 0, prompt_tokens: 0), generations: Generations(text: "", tokens: 0))
/* 형태
 {
   "generations" : [
     {
       "text" : " 두번째 글이야. 반가워!! 안녕하세요, 박소연입니다. 겨울이의 위험한 동거 2편을 만나보겠습니다! *도움이 되실만한 약간의 텍스트를 첨가했으니 기대해주세용* 점점 울음소리가",
       "tokens" : 50
     },
     {
       "tokens" : 50,
       "text" : "왓호! 위대한똥입니다. ​ 오늘은 아주 흡족한 에어프라이어 요리 이야기랍니다. ​ ​ 사실, 별건 아니고 새로 데려온 제품의 프로필 사진도 찍고 그렇게 해 먹으려고 하다가 시간이 너무 오래 지나버렸"
     },
     {
       "tokens" : 50,
       "text" : " 노이즈 마케팅 음향을 편집하면서 자주 듣는 말 중 가장 많은 곤란한 점 1위!! 바로 '원음 깔끔해' 이다. 내 원말로 작작해라 쫌!!! 이렇게 버럭~! 해주시면 또 슬쩍 원말 컨"
     },
     {
       "tokens" : 50,
       "text" : " 자 못됐어. 네가 임무를 수행하려면 저쪽으로 가야 해 꼭 솔이 다치게 하는 방법도 너하고 똑같잖아. 지금 우리 친구 먹었지? 아니꼽지만 진심이야 이번엔 정말 미안해 우선 너희 부모"
     },
     {
       "tokens" : 50,
       "text" : " 이 길 끝에는 무엇이 있을까요? 어디로 날아갈 수 있나요? 그 곳의 풍경은... 노을진 강바닥으로부터 번져오고 있어요? 노을빛으로 무거워진 풀들을 한 겹씩 햇볕 속으로 거두어"
     }
   ],
   "id" : "09b06aaa-6597-49d4-a6cc-b38d7823e290",
   "usage" : {
     "total_tokens" : 280,
     "generated_tokens" : 250,
     "prompt_tokens" : 30
   }
 }
 */

