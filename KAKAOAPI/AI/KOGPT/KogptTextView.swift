//
//  KogptTextView.swift
//  KAKAOAPI
//
//  Created by 강대민 on 2023/02/14.
//

import SwiftUI

struct KogptTextView: View {
  @State private var kogptParamViewPresented = false
  @StateObject var kogptParam = KogptParam()
  
  var body: some View {
    NavigationView {
      VStack {
        Text("Prompt: \(kogptParam.prompt)")
        Text("Max Tokens: \(kogptParam.max_tokens)")
        Text("Temperature: \(kogptParam.temperature)")
        Text("Top P: \(kogptParam.top_p)")
        Text("N: \(kogptParam.n)")
        
  //      Button(action: {
  //        APICalled(<#T##text: String##String#>, url: <#T##String#>, parameters: <#T##[String : Any]#>, headers: <#T##[String : String]#>, completion: <#T##(Result<Decodable, AFError>) -> Void#>)
  //      }) {
  //        Text("메세지 생성하기")
  //      }
        
      }
    //왜 preview에선 에러가 발생하는가.
      .toolbar {
          ToolbarItem(placement: .navigationBarTrailing) {
              Button(action: {
                kogptParamViewPresented = true
              }) {
                  Image(systemName: "gear")
              }
          }
      }
      .sheet(isPresented: $kogptParamViewPresented) {
        KogptParamView(kogptParam: kogptParam, isPresented: $kogptParamViewPresented)
//          GeometryReader { proxy in
//              KogptParamView(kogptParam: kogptParam, isPresented: $kogptParamViewPresented)
//                  .frame(width: proxy.size.width, height: proxy.size.height)
//          }
      }
      
//      .navigationBarItems(trailing:
//                            Button(action: {
//        isOptionViewPresented = true
//      }) {
//        Image(systemName: "gear")
//      })
//      .sheet(isPresented: $isOptionViewPresented) {
//        KogptParamView(kogptParam: kogptParam)
//      }
    }
  }
}

struct KogptTextView_Previews: PreviewProvider {
    static var previews: some View {
        KogptTextView()
    }
}
