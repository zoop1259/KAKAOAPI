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
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                List(kogptAPI.kogptModel, id:\.id) { model in
                    ForEach(model.generations, id: \.text) { generation in
                        VStack {
                            Text(generation.text)
                            Text("Total Tokens: \(model.usage.totalTokens)")
                        }
                    }
                }
            }
        }
        
        Group {
            HStack {
                TextField("Enter your prompt", text: $prompt, axis: .vertical)
                    .padding([.leading, .trailing], 20)
                Button(action: {
                    self.kogptAPI.kogpt_api(prompt: self.prompt)
                }) {
                    Image(systemName: "checkmark")
                }
            }
            .padding([.leading, .trailing], 20)
        }
        .frame(maxHeight: .infinity, alignment: .bottom)
        .navigationTitle("KOGPT")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct KOGPTView_Previews: PreviewProvider {
    static var previews: some View {
        KOGPTView()
    }
}
