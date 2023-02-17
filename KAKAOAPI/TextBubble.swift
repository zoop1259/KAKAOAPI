//
//  TextBubble.swift
//  KAKAOAPI
//
//  Created by 강대민 on 2023/02/15.
//

import SwiftUI

struct TextBubble: View {
  var text: String
  
  var body: some View {
    ZStack {
      ZStack {
          Text(text)
      }
        .padding(10)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .shadow(radius: 15)
        )
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .zIndex(1)
  }
}
  
struct TextBubble_Previews: PreviewProvider {
    static var previews: some View {
        TextBubble(text: "안녕안녕안")
    }
}
