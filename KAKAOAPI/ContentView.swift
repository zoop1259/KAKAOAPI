//
//  ContentView.swift
//  KAKAOAPI
//
//  Created by 강대민 on 2023/02/04.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            let _ = print(kogpt_api(prompt: "안녕? 넌 누구야?"))
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
