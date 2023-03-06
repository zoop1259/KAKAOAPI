//
//  KOGPTView.swift
//  KAKAOAPI
//
//  Created by 강대민 on 2023/02/07.
//

import SwiftUI

struct KOGPTView: View {
    @ObservedObject var kogptAPI = KOGPTAPI()
    @State var prompt = ""
    
    @State private var kogptParamViewPresented = false
    @StateObject var kogptParam = KogptParam()
    
    var body: some View {
        Group {
            
            List(kogptAPI.kogptModel, id:\.id) { model in
                ForEach(model.generations, id: \.text) { generation in
                    VStack {
                        Text("\(prompt)\(generation.text)")
                        Text("Total Tokens: \(model.usage.totalTokens)")
                    }
                }
            }
            
            HStack {
                TextField("글을 입력해보세요.", text: $prompt, axis: .vertical)
                    .padding( .leading, 10)
                Button(action: {
                    kogptAPI.kogpt_api(prompt: prompt, max_tokens: kogptParam.max_tokens, temperature: kogptParam.temperature, top_p: kogptParam.top_p, n: kogptParam.n)
                }) {
                    Image(systemName: "checkmark")
                }
            }
            .padding(.trailing, 20)
            Text("token:\(kogptParam.max_tokens), temp:\(kogptParam.temperature), top:\(kogptParam.top_p), n:\(kogptParam.n)")
                .font(.footnote)
                .fontWeight(.ultraLight)
        }
        .frame(maxHeight: .infinity, alignment: .bottom)
        .navigationTitle("KOGPT")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(trailing:
                                Button(action: {
            kogptParamViewPresented = true
        }) {
            Image(systemName: "gear")
        })
        .sheet(isPresented: $kogptParamViewPresented) {
            KogptParamView(kogptParam: kogptParam, isPresented: $kogptParamViewPresented)
        }
    }
}

struct KOGPTView_Previews: PreviewProvider {
    static var previews: some View {
        KOGPTView()
    }
}
