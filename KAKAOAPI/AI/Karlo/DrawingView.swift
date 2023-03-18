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
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var fileManager = MyFileManager()
    let fileURL: URL
    
    var body: some View {
        NavigationView {
            if let image = UIImage(contentsOfFile: fileURL.path) {
                let uiImage = image.withRenderingMode(.alwaysOriginal)
                let cgImage = uiImage.cgImage!
                Image(cgImage, scale: uiImage.scale, label: Text(fileURL.lastPathComponent))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } else {
                Text("이미지 로드 실패")
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(trailing: Button(action: {
            fileManager.deleteImage(at: fileURL)
            presentationMode.wrappedValue.dismiss()
        }) {
            Text("이미지 삭제")
        })
    }
}

//struct DrawingView_Previews: PreviewProvider {
//    static var previews: some View {
//        DrawingView()
//    }
//}
