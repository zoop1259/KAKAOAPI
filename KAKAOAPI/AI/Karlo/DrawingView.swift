//
//  DrawingView.swift
//  KAKAOAPI
//
//  Created by 강대민 on 2023/03/06.
//

import SwiftUI
import Photos

///이미지를 선택했을때 나타나는 View
/**
    
 
 
 */
struct DrawingView: View {
    
    let karloModel : KarloModel
    
    var body: some View {
        
        Text("이미지")
        
        let _ = print(karloModel.images)
        
    }
}

//struct DrawingView_Previews: PreviewProvider {
//    static var previews: some View {
//        DrawingView()
//    }
//}
