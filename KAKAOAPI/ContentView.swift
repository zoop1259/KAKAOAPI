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
    @State private var isShowingTextBubble = false
    
    
    var body: some View {
        NavigationView {
            ZStack {
                
                let _ = print(naverAPICall("hi DaeMin"))
                
                VStack {
                    NavigationLink(destination: KarloView()) {
                        HStack {
                            Image("KarloLogo")
                                .resizable()
                                .frame(width: 100, height: 100)
                            
                            Spacer()
                            
                            VStack(spacing: 10) {
                                Text("Karlo")
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                
                                Text("kakao brain으로 이미지 생성")
                                    .multilineTextAlignment(.trailing)
                                    .font(.footnote)
                                    .foregroundColor(.white)
                            }
                            
                            Spacer()
                        }
                        .padding(20)
                        .frame(maxWidth: .infinity)
                        .background(.blue)
                    }
                    .cornerRadius(20)
                    .padding(30)
                    
                    //          NavigationLink(destination: KOGPTView()) {
                    NavigationLink(destination: KogptTextView()) {
                        HStack {
                            Image("KogptLogo")
                                .resizable()
                                .frame(width: 100, height: 100)
                            
                            Spacer()
                            
                            VStack(spacing: 10) {
                                Text("KoGPT")
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                
                                Text("kakao brain으로 text 생성")
                                    .multilineTextAlignment(.trailing)
                                    .font(.footnote)
                                    .foregroundColor(.white)
                            }
                            
                            Spacer()
                        }
                        .padding(20)
                        .frame(maxWidth: .infinity)
                        .background(.blue)
                    }
                    .cornerRadius(20)
                    .padding(30)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
