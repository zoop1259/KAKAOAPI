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
    @State var maxTokens = Array(1...512)
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    HStack {
                        Text("Max Tokens: ")
                        Menu {
                            ForEach(maxTokens.reversed(), id: \.self) { token in
                                Button(action: {
                                    kogptParam.max_tokens = token
                                }) {
                                    Text("\(token)")
                                }
                            }
                        } label: {
                            Text("\(kogptParam.max_tokens)")
                                .fontWeight(.bold)
                        }
                    }
                } footer: {
                    Text("토큰 수 - 생설할 텍스트 길이 설정")
                }
                
                Section {
                    VStack {
                        Text("Temperature: \(kogptParam.temperature)")
                        Slider(value: $kogptParam.temperature, in: 0.0...1.0)
                    }
                } footer: {
                    Text("온도 - 값이 높을수록 창의적인 결과 생성")
                }
                
                Section {
                    VStack {
                        Text("Top_p: \(kogptParam.top_p)")
                        Slider(value: $kogptParam.top_p, in: 0.0...1.0)
                    }
                } footer: {
                    Text("상위 확률 - 값이 높을수록 창의적인 결과 생성")
                }
                
                Section {
                    Stepper(value: $kogptParam.n, in: 1...16) {
                        Text("N: \(kogptParam.n)")
                    }
                } footer: {
                    Text("수 - 생성할 결과 수 설정")
                }
            }
            .onDisappear()
            .padding()
            .navigationBarTitle("KoGPT 옵션 설정")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: Button(action: {
                isPresented = false
            }) {
                Image(systemName: "checkmark")
            })
        }
    }
}

//struct KogptParamView_Previews: PreviewProvider {
//    static var previews: some View {
//        KogptParamView()
//    }
//}


