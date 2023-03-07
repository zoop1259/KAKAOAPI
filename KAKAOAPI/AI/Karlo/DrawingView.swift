//
//  DrawingView.swift
//  KAKAOAPI
//
//  Created by 강대민 on 2023/03/06.
//

import SwiftUI

struct DrawingView: View {
    @State private var fileManager = FileManager.default
    @State private var documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first ?? nil
    @State private var imageList = [URL]()
    
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct DrawingView_Previews: PreviewProvider {
    static var previews: some View {
        DrawingView()
    }
}
