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
        VStack {
            TextField("Enter your prompt", text: $prompt)
            Button(action: {
                self.kogptAPI.kogpt_api(prompt: self.prompt)
            }) {
                Text("Generate Text")
            }
            List(kogptAPI.kogptModel, id:\.id) { model in
                ForEach(model.generations, id: \.text) { generation in
                    Text(generation.text)
                }
            }
        }
    }
}

struct KOGPTView_Previews: PreviewProvider {
    static var previews: some View {
        KOGPTView()
    }
}
