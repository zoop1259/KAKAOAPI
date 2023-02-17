//
//  KogptParamView.swift
//  KAKAOAPI
//
//  Created by 강대민 on 2023/02/14.
//

import SwiftUI

struct KogptParamView: View {
  @ObservedObject var kogptParam: KogptParam
  @Binding var isPresented: Bool
  
  var body: some View {
      VStack {

          Stepper(value: $kogptParam.max_tokens, in: 1...512) {
              Text("Max Tokens: \(kogptParam.max_tokens)")
          }
        VStack {
            Slider(value: $kogptParam.temperature, in: 0.0...1.0)
            Text("Temperature: \(kogptParam.temperature)")
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
        }
          Text("Temperature: \(kogptParam.temperature)")
        
          Slider(value: $kogptParam.top_p, in: 0.0...1.0) {
              Text("Top P: \(kogptParam.top_p)")
          }
          Stepper(value: $kogptParam.n, in: 1...16) {
              Text("N: \(kogptParam.n)")
          }
          Button(action: {
            // Do something
            isPresented = false
          }, label: {
              Text("Done")
          })
      }
      .onDisappear()
      .padding()
    
    /* 고려해볼 코드
     //네비게이션링크엔 longpressgesture를 사용하기 어렵다.
     //NavigationLink가 뷰를 변경하기 위해 이미 제스처 이벤트를 사용하기 때문
     Text("longpressgesture 테스트용")
       .gesture(LongPressGesture(minimumDuration: 0.5)
         .onEnded { _ in
           isShowingTextBubble = true
         }
       )
     //.padding()
     if isShowingTextBubble {
       TextBubble(text: "안녕안녕안안녕안녕안안녕안녕안안녕안녕안안녕안녕안안녕안녕안안녕안녕안안녕안녕안안녕안녕안안녕안녕안안녕안녕안안녕안녕안안녕안녕안안녕안녕안안녕안녕안안녕안녕안안녕안녕안안녕안녕안안녕안녕안안녕안녕안안녕안녕안안녕안녕안안녕안녕안안녕안녕안안녕안녕안안녕안녕안안녕안녕안안녕안녕안안녕안녕안안녕안녕안, \(isShowingTextBubble)")
       let _ = print("눌렸다.")
         .onTapGesture {
           isShowingTextBubble = false
         }
         .onDisappear {
           isShowingTextBubble = false
         }
     */
  }
}

//struct KogptParamView_Previews: PreviewProvider {
//    static var previews: some View {
//        KogptParamView()
//    }
//}
