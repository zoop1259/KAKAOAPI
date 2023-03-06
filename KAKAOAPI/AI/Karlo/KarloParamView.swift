//
//  KarloParamView.swift
//  KAKAOAPI
//
//  Created by 강대민 on 2023/03/01.
//

import SwiftUI

struct KarloParamView: View {
    @ObservedObject var karloParam: KarloParam
    @Binding var popupViewPresented: Bool
    
    var body: some View {
        ZStack {
            Color.white
            VStack {
                Text("번역 여부 설정")
                    .font(.title)
                Toggle(isOn: $karloParam.translate) {
                    Text("On : 한 -> 영")
                        .font(.title3)
                    let _ = print(karloParam.translate)
                }
                .padding(7) //이리 사용하면 침범한다.
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 1)
                )
                .padding(10) //overlay의 padding
                .toggleStyle(SwitchToggleStyle(tint: Color.blue))
            }
        }
        .frame(width: 300, height: 200)
        .cornerRadius(10)
        .shadow(radius: 10)
        .navigationBarItems(trailing: Button(action: {}) {
            Image(systemName: "checkmark")
        })
        .onTapGesture {
            popupViewPresented = false
        }
    }
}

//struct KarloParamView_Previews: PreviewProvider {
//    static var previews: some View {
////        KarloParamView(translate: true)
//        KarloParamView(karloParam: KarloParam())
//    }
//}
