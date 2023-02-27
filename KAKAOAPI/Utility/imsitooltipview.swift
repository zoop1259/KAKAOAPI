//
//  imsitooltipview.swift
//  KAKAOAPI
//
//  Created by 강대민 on 2023/02/23.
//
import SwiftUI
import SwiftUITooltip

struct ToolTipView: View {
    var tooltipConfig = DefaultTooltipConfig()
    @State var tooltipVisible = false
    @State var textFieldVisible = false
    @State var textFieldText = ""
    
    @State var longVisible = true
    init() {
        self.tooltipConfig.enableAnimation = true
        self.tooltipConfig.animationOffset = 10
        self.tooltipConfig.animationTime = 1
//        self.tooltipConfig.contentPaddingBottom = 10 //말풍선크기 (padding)관련
    }
    
    var body: some View {
        VStack {
            
            ZStack {
                TextField("Enter text", text: $textFieldText)
                    .padding()
                    .background(Color.gray)
                    .cornerRadius(10)
    //                .onTapGesture { hideKeyboard() } // 키보드 숨기기
                    .onTapGesture {
                        self.longVisible = false
                    }
                    .onLongPressGesture {
                        self.longVisible.toggle()
                    }
                    .tooltip(self.longVisible, side: .top) {
                        Text("이렇게하면..?")
                    }
                
                Text("")
                    .tooltip(self.longVisible, side: .topLeft) {
                        Text("이렇게하면 보이려나.")
                    }
            }

            Text("Say something nice...")
                .tooltip(.right , config: tooltipConfig) {
                    Text("Something nice!")
                }
            
            Button("Toggle tooltip") {
                self.tooltipVisible = !self.tooltipVisible
            }
            
            Text("I'm the confusing text.")
                .tooltip(self.tooltipVisible) {
                    Text("I'm the text explaining the confusing text.")
                }
            
            Text("롱탭툴팁.")
                .tooltip(self.longVisible) {
                    Text("I'm the text explaining the confusing text.")
                }
            
        }
    

        
        
        
    }
}

struct ToolTipView_Previews: PreviewProvider {
    static var previews: some View {
        ToolTipView()
    }
}
