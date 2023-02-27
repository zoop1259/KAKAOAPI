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
        NavigationView {
          ScrollView {
            VStack(spacing: 20) {
              TextField("Enter your prompt", text: $prompt, axis: .vertical)
                .padding([.leading, .trailing], 20)
                
              Button(action: {
                self.kogptAPI.kogpt_api(prompt: self.prompt)
              }) {
                Text("Generate Text")
              }
              .padding([.leading, .trailing], 20)
                
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
          .navigationTitle("KOGPT")
          .navigationBarTitleDisplayMode(.inline)
        }
        
//        .navigationBarTitle("KOGPT")
    }
}

struct KOGPTView_Previews: PreviewProvider {
    static var previews: some View {
        KOGPTView()
    }
}
