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
    
    @State private var fileManager = FileManager.default
    @State private var documentsDirectory: URL? = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
    @State private var fileList = [URL]()
    
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
                        //                ForEach(fileList, id: \.self) { fileURL in
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
    
    func fetchFiles() {
        do {
            guard let documentsDirectory = documentsDirectory else {
                fatalError("Documents directory not found")
            }
            let contents = try fileManager.contentsOfDirectory(at: documentsDirectory, includingPropertiesForKeys: nil)
            fileList = contents.filter { $0.pathExtension == "png" }
        } catch {
            print("Unable to fetch files: \(error)")
        }
    }
    
    func saveImage() {
        let randomInt = Int.random(in: 100000..<9999999999)
        let imageName = "image\(randomInt)"
        let image = karloAPI.image
        guard let documentsDirectory = documentsDirectory else {
            fatalError("Documents directory not found")
        }
        let fileURL = documentsDirectory.appendingPathComponent(imageName).appendingPathExtension("png")
        if let imageData = image?.pngData() {
            do {
                let permissions = [FileAttributeKey : Any]()
                try FileManager.default.createDirectory(at: documentsDirectory, withIntermediateDirectories: true, attributes: permissions)
                try imageData.write(to: fileURL)
                fileList.append(fileURL)
                fetchFiles()
            } catch {
                print("이미지 저장중 에러 발생: \(error)")
            }
        }
    }
}

struct KarloView_Previews: PreviewProvider {
    static var previews: some View {
        KarloView()
    }
}

