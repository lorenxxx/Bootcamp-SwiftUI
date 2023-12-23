//
//  FileManagerBootcamp.swift
//  Bootcamp-SwiftUI
//
//  Created by loren on 2023/12/23.
//

import SwiftUI

struct FileManagerBootcamp: View {
    
    @StateObject var vm = FileManagerViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if let image = vm.image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 10.0))
                }
                
                VStack {
                    Button(action: {
                        vm.saveImage()
                    }, label: {
                        Text("Save To FileManager")
                            .font(.headline)
                            .foregroundStyle(.white)
                            .padding()
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(.blue)
                            .clipShape(RoundedRectangle(cornerRadius: 10.0))
                    })
                    
                    Button(action: {
                        vm.deleteImage()
                    }, label: {
                        Text("Delete From FileManager")
                            .font(.headline)
                            .foregroundStyle(.white)
                            .padding()
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(.red)
                            .clipShape(RoundedRectangle(cornerRadius: 10.0))
                    })
                }
                .padding()
                
                Text(vm.infoMessage)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                
                Spacer()
            }
            .navigationTitle("File Manager")
        }
    }
}

class FileManagerViewModel: ObservableObject {
    
    let fileManager = LocalFileManager.instance
    
    let imageName: String = "lorenliang"
    
    @Published var image: UIImage? = nil
    
    @Published var infoMessage: String = ""
    
    init() {
        getImageFromAssetsFolder()
        //getImageFromFileManager()
    }
    
    func getImageFromAssetsFolder() {
        image = UIImage(named: imageName)
    }
    
    func getImageFromFileManager() {
        image = fileManager.getImage(name: imageName)
    }
    
    func saveImage() {
        guard let image = image else { return }
        infoMessage = fileManager.saveImage(image: image, name: imageName)
    }
    
    func deleteImage() {
        infoMessage = fileManager.deleteImage(name: imageName)
        fileManager.deleteFolder()
    }
    
}

class LocalFileManager {
    
    static let instance = LocalFileManager()
    
    let folderName: String = "MyApp_Images"
    
    init() {
        createFolderIfNeeded()
    }
    
    func getPathForImage(name: String) -> URL? {
        guard
            let path = FileManager
                .default
                .urls(for: .cachesDirectory, in: .userDomainMask)
                .first?
                .appendingPathComponent(folderName)
                .appendingPathComponent("\(name).jpeg") else {
            print("Error getting path")
            return nil
        }
        
        return path
    }
    
    func saveImage(image: UIImage, name: String) -> String {
        guard
            let data = image.jpegData(compressionQuality: 1.0),
            let path = getPathForImage(name: name)
        else {
            print("Error get data.")
            return "Error get data."
        }
        
        do {
            try data.write(to: path)
            print("Successfully saving. path: \(path)")
            return "Successfully saving."
        } catch let error {
            print("Error saving. \(error)")
            return "Error saving."
        }
        
    }
    
    func getImage(name: String) -> UIImage? {
        guard
            let path = getPathForImage(name: name)?.path,
            FileManager.default.fileExists(atPath: path)
        else {
            print("Error getting path.")
            return nil
        }
        
        return UIImage(contentsOfFile: path)
    }
    
    func deleteImage(name: String) -> String {
        guard
            let path = getPathForImage(name: name),
            FileManager.default.fileExists(atPath: path.path)
        else {
            print("Error getting path.")
            return "Error getting path."
        }
        
        do {
            try FileManager.default.removeItem(at: path)
            print("Successfully delete image.")
            return "Successfully delete image."
        } catch let errror {
            print("Error delete image. \(errror)")
            return "Error delete image."
        }
    }
    
    func createFolderIfNeeded() {
        guard
            let path = FileManager
                .default
                .urls(for: .cachesDirectory, in: .userDomainMask)
                .first?
                .appendingPathComponent(folderName)
                .path
        else {
            return
        }
        
        if !FileManager.default.fileExists(atPath: path) {
            do {
                try FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true)
                print("Successfully create directory.")
            } catch let error {
                print("Error create directory. \(error)")
            }
            
        }
    }
    
    func deleteFolder() {
        guard
            let path = FileManager
                .default
                .urls(for: .cachesDirectory, in: .userDomainMask)
                .first?
                .appendingPathComponent(folderName)
                .path
        else {
            return
        }
        
        do {
            try FileManager.default.removeItem(atPath: path)
            print("Successfully delete folder.")
        } catch let error {
            print("Error delete folder. \(error)")
        }
        
    }
    
}

#Preview {
    FileManagerBootcamp()
}
