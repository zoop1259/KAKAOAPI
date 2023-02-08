//
//  KarloView.swift
//  KAKAOAPI
//
//  Created by 강대민 on 2023/02/08.
//

import SwiftUI

struct KarloView: View {
  @ObservedObject var karloAPI = KarloAPI()
  @State private var inputText: String = ""

  var body: some View {
    VStack {
      TextField("Enter text here", text: $inputText)
        .padding()

      Button(action: {
        karlo_api(text: self.inputText) { image in
          self.karloAPI.image = image
        }
      }) {
        Text("Submit")
      }
      .padding()

      if let image = karloAPI.image {
        Image(uiImage: image)
      } else {
        Text("Loading...")
      }
    }
  }
}

struct KarloView_Previews: PreviewProvider {
    static var previews: some View {
        KarloView()
    }
}

