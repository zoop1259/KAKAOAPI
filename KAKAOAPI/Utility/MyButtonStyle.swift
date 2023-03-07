//
//  MyButtonStyle.swift
//  KAKAOAPI
//
//  Created by 강대민 on 2023/03/07.
//

import SwiftUI

//viewModifier가 아닌 ButtonStyle 상속
struct MyButtonStyle: ButtonStyle {
    var disabled: Bool = false
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .padding(5)
            .background(disabled ? Color.gray : Color.blue)
            .cornerRadius(5)
            .disabled(disabled)
    }
}

/*
 //속성을 변경하면서 사용하려면 아래처럼 해야한다.
struct MyButtonStyle: ViewModifier {
    let foregroundColor: Color
    let backgroundColor: Color
    let cornerRadius: CGFloat
    
    func body(content: Content) -> some View {
        content
            .buttonStyle(BorderlessButtonStyle())
            .foregroundColor(foregroundColor)
            .padding(10)
            .background(backgroundColor)
            .cornerRadius(cornerRadius)
    }
}

extension Button {
    func myButtonStyle(foregroundColor: Color = .white, backgroundColor: Color = .blue, cornerRadius: CGFloat = 5.0) -> some View {
        self.modifier(MyButtonStyle(foregroundColor: foregroundColor, backgroundColor: backgroundColor, cornerRadius: cornerRadius))
    }
}
*/
