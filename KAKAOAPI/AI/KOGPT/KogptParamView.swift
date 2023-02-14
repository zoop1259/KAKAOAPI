//
//  KogptParamView.swift
//  KAKAOAPI
//
//  Created by 강대민 on 2023/02/14.
//

import SwiftUI

struct KogptParamView: View {
  @ObservedObject var kogptParam: KogptParam
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
            
          }, label: {
              Text("Done")
          })
      }
      .onDisappear()
      .padding()
  }
}


//struct KogptParamView_Previews: PreviewProvider {
//    static var previews: some View {
//        KogptParamView()
//    }
//}
