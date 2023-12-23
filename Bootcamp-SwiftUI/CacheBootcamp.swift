//
//  CacheBootcamp.swift
//  Bootcamp-SwiftUI
//
//  Created by loren on 2023/12/23.
//

import SwiftUI

struct CacheBootcamp: View {
    
    @StateObject var vm = CacheViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if let image = vm.startingImage {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 10.0))
                        .padding()
                }
                
                if let image = vm.cachedImage {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 10.0))
                        .padding()
                }
                
                Button(action: {
                    vm.getFromCache()
                }, label: {
                    Text("Get From Cache")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(.green)
                        .clipShape(RoundedRectangle(cornerRadius: 10.0))
                        .padding(.horizontal)
                    
                })
                
                Button(action: {
                    vm.saveToCache()
                }, label: {
                    Text("Save To Cache")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 10.0))
                        .padding(.horizontal)
                    
                })
                
                Button(action: {
                    vm.removeFromCache()
                }, label: {
                    Text("Delete To Cache")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(.red)
                        .clipShape(RoundedRectangle(cornerRadius: 10.0))
                        .padding(.horizontal)
                    
                })
                
                Spacer()
            }
            .navigationTitle("Cache")
        }
    }
}

class CacheViewModel: ObservableObject {
    
    let cacheManager = CacheManager.instance
    
    let imageName: String = "lorenliang"
    
    @Published var startingImage: UIImage? = nil
    
    @Published var cachedImage: UIImage? = nil
    
    init() {
        getImageFromAssetsFolder()
    }
    
    func getImageFromAssetsFolder() {
        startingImage = UIImage(named: imageName)
    }
    
    func saveToCache() {
        guard let image = startingImage else { return }
        cacheManager.add(image: image, name: imageName)
    }
    
    func removeFromCache() {
        cacheManager.remove(name: imageName)
    }
    
    func getFromCache() {
        cachedImage = cacheManager.get(name: imageName)
    }
    
}

class CacheManager {
     
    static let instance = CacheManager()
    
    private init() {}
    
    var imageCache: NSCache<NSString, UIImage> = {
        let cache = NSCache<NSString, UIImage>()
        cache.countLimit = 100
        cache.totalCostLimit = 1024 * 1024 * 100 // 100mb
        return cache
    }()
    
    func add(image: UIImage, name: String) {
        imageCache.setObject(image, forKey: name as NSString)
        print("Add to cache!")
    }
    
    func remove(name: String) {
        imageCache.removeObject(forKey: name as NSString)
        print("Remove from cache!")
    }
    
    func get(name: String) -> UIImage? {
        return imageCache.object(forKey: name as NSString)
    }
    
}

#Preview {
    CacheBootcamp()
}
