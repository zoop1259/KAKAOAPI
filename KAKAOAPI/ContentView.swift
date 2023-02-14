//
//  ContentView.swift
//  KAKAOAPI
//
//  Created by 강대민 on 2023/02/04.
//

//https://developers.kakao.com/sdk/reference/ios/release/index.html //KAKAO SDK 문서.

import SwiftUI
import Alamofire

struct ContentView: View {
    
    var body: some View {
      NavigationView {
        VStack {
          //let _ = print(kogpt_api(prompt: "안녕? 넌 누구야?"))
            let _ = print("아아 테스트테스트")
            let _ = print(naverAPICall("안녕 대민"))
           
          HStack {
            Image("KarloLogo")
              .resizable()
              .frame(width: 100, height: 100)
  //              .overlay { // <-
  //                Rectangle().stroke(.blue, lineWidth: 4)
  //              }
            
            
          }
          
          NavigationLink(destination: KOGPTView()) {
            HStack(spacing: 20) {
              Image("KogptLogo")
                .resizable()
                .frame(width: 100, height: 100)
              
              VStack {
                Text("KOGPT")
                  .foregroundColor(.white)
              }
            }
            .background(.blue)
            
          }
        }
        //.padding()
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
