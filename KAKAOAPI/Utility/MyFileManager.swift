//
//  MyFileManager.swift
//  KAKAOAPI
//
//  Created by 강대민 on 2023/03/09.
//

import SwiftUI
import Photos

final class MyFileManager: ObservableObject {
    
    @Published private var fileManager = FileManager.default
    @Published private var documentsDirectory: URL? = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
    @Published var fileList = [URL]()
    
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
    
    func saveImage(_ image: UIImage?) {
        let randomInt = Int.random(in: 100000..<9999999999)
        let imageName = "image\(randomInt)"
        let image = image
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
                self.fetchFiles()
            } catch {
                print("이미지 저장중 에러 발생: \(error)")
            }
        }
    }
    
    func deleteImage(at url: URL) {
        do {
            try FileManager.default.removeItem(at: url)
            fileList = fileList.filter { $0 != url }
            self.fetchFiles()
        } catch {
            print("이미지 삭제중 에러 발생: \(error)")
        }
    }
    
    
}
