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
    @State private var popupPresented: Bool = false
    //StateObject를 사용하지 않으면 toggle을 false한상태에서 다시 뷰를 호출하면 true로 되어버림.
    @StateObject var karloParam = KarloParam()
    @StateObject var myFileManager = MyFileManager()

    
    var body: some View {
        //자동줄바꿈은 axis: .vertical을 쓰면된다...
        ZStack {
            VStack {
                ScrollView {
                    TextField("단어를 입력해주세요.", text: $inputText, axis: .vertical)
                        .font(.title2)
                        .padding([.top,.leading,.trailing], 20)
                    HStack {
                        Spacer()
                        
                        Button(action: {
                            karloAPI.image = nil
                            self.karloAPI.fetchImage(text: self.inputText)
                            self.showImage = true //이게 필요없을수도.
                        }) {
                            Text("그리기")
                        }
                        .buttonStyle(MyButtonStyle(disabled: inputText.isEmpty))
                        
                        Spacer()
                        
                        Button(action: {
                            if karloAPI.image != nil {
                                let _ = print("이미지 있어.")
                                //saveImage()
                                myFileManager.saveImage(karloAPI.image)
                                
                            }
                        }) {
                            Text("저장하기")
                        }
                        .buttonStyle(MyButtonStyle(disabled: karloAPI.image == nil))
                        
                        Spacer()
                    }
                    .padding()
                    
                    if showImage {
                        if let image = karloAPI.image {
                            Image(uiImage: image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                            //.frame(width: UIScreen.main.bounds.width - 20, height: UIScreen.main.bounds.width - 20, alignment: .center)
                                .background(Color.gray)
                                .cornerRadius(20)
                                .padding(.all, 10)
                            
                            //.frame(width: 200, height: 200, alignment: .center)
                            // 이미지가 표시될 때 showImage 값을 true에서 false로 변경
                            Button(action: {
                                self.showImage = false
                                karloAPI.image = nil
                                let _ = print("지워졌는가? : ",karloAPI.image)
                            }) {
                                Text("이미지 제거")
                            }
                            .padding()
                        } else {
                            DotLoadingView()
                                .frame(width: 60, height: 30)
                        }
                    } else {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: UIScreen.main.bounds.width - 20, height: UIScreen.main.bounds.width - 20, alignment: .center)
                    }
                }
                .border(.blue, width: 5)
                
                ScrollView(.horizontal) {
                    LazyHStack {
                        ForEach(myFileManager.fileList, id: \.self) { fileURL in
                            if let image = UIImage(contentsOfFile: fileURL.path) {
                                
                                Image(uiImage: image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 100, height: 100)
                                    .cornerRadius(10)
                            }
                        }
                    }
                    .border(.red, width: 5)
                }
                .frame(width: UIScreen.main.bounds.width, height: 100)
                .padding(.leading, 10)
                //        .onAppear(perform: fetchFiles)
                .onAppear(perform: myFileManager.fetchFiles)
            }
            .navigationTitle("Karlo")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: Button(action: {
                popupPresented.toggle()
            }) {
                Image(systemName: "gear")
            })
            if popupPresented {
                //            KarloParamView(karloParam: KarloParam(), popupViewPresented: $popupPresented)
                //StateOjbect를 사용한 값을 넣어줘야함. 위처럼 사용하면 안됨.
                KarloParamView(karloParam: karloParam, popupViewPresented: $popupPresented)
            }
        }
    }
}

struct KarloView_Previews: PreviewProvider {
    static var previews: some View {
        KarloView()
    }
}

/*
 ScrollView(.horizontal) {
     LazyHStack {
         ForEach(myFileManager.fileList, id: \.self) { fileURL in
             if let image = UIImage(contentsOfFile: fileURL.path) {
                 NavigationLink(destination: FileDetailView(fileURL: fileURL)) {
                     Image(uiImage: image)
                         .resizable()
                         .aspectRatio(contentMode: .fit)
                         .frame(width: 100, height: 100)
                         .cornerRadius(10)
                 }
             }
         }
     }
     .border(.red, width: 5)
 }
 
 struct FileDetailView: View {
     let fileURL: URL
     
     var body: some View {
         Text("File Detail View for \(fileURL.lastPathComponent)")
     }
 }
 
 
 ---
 
 struct ContentView: View {
     @State var selectedFileURL: URL? = nil
     
     var body: some View {
         ScrollView(.horizontal) {
             LazyHStack {
                 ForEach(myFileManager.fileList, id: \.self) { fileURL in
                     if let image = UIImage(contentsOfFile: fileURL.path) {
                         Image(uiImage: image)
                             .resizable()
                             .aspectRatio(contentMode: .fit)
                             .frame(width: 100, height: 100)
                             .cornerRadius(10)
                             .onTapGesture {
                                 selectedFileURL = fileURL
                             }
                     }
                 }
             }
             .border(.red, width: 5)
         }
         .sheet(item: $selectedFileURL) { fileURL in
             FileDetailView(fileURL: fileURL)
         }
     }
 }
 */
