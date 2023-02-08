//
//  ContentView.swift
//  KAKAOAPI
//
//  Created by 강대민 on 2023/02/04.
//

//https://developers.kakao.com/sdk/reference/ios/release/index.html //KAKAO SDK 문서.

import SwiftUI

struct ContentView: View {
    
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            //let _ = print(kogpt_api(prompt: "안녕? 넌 누구야?"))
          let _ = print("아아 테스트테스트")

          
//          let _ = print(karlo_api(text: "sun", completion: { image in
//            if let image = image {
//                let imageView = UIImageView(image: image)
//                imageView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
//                // Add imageView to your view hierarchy
//            } else {
//                print("Failed to generate image")
//            }
//          }))
          
//          karlo_api(text: "sun", completion: { image in
//            if let image = image {
//                let imageView = UIImageView(image: image)
//                imageView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
//                // Add imageView to your view hierarchy
//            } else {
//                print("Failed to generate image")
//            }
//          })
          
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
