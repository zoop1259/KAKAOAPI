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
    @State private var showImage: Bool = false
    
    var body: some View {
        //자동줄바꿈은 axis: .vertical을 쓰면된다...
        ScrollView {
            TextField("단어를 입력해주세요.", text: $inputText, axis: .vertical)
                .font(.title2)
                .padding([.top,.leading,.trailing], 20)
            Button(action: {
                karloAPI.image = nil
                self.karloAPI.fetchImage(text: self.inputText)
                self.showImage = true //이게 필요없을수도.
            }) {
                Text("그리기")
            }
            .padding()
            
            if showImage {
                if let image = karloAPI.image {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: UIScreen.main.bounds.width - 20, height: UIScreen.main.bounds.width - 20, alignment: .center)
                        .background(Color.gray)
                        .cornerRadius(20)
                        .padding(.all, 10)
                    //.frame(width: 200, height: 200, alignment: .center)
                    // 이미지가 표시될 때 showImage 값을 true에서 false로 변경
                    Button(action: {
                        self.showImage = false
                    }) {
                        Text("이미지 제거")
                    }
                    .padding()
                } else {
                    //          Text("Loading...")
                    DotLoadingView()
                        .frame(width: 60, height: 30)
                }
            }
        }
    }
}

struct KarloView_Previews: PreviewProvider {
    static var previews: some View {
        KarloView()
    }
}

