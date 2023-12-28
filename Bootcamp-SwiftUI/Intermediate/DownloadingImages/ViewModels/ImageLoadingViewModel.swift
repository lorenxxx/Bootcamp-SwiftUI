//
//  ImageLoadingViewModel.swift
//  Bootcamp-SwiftUI
//
//  Created by loren on 2023/12/23.
//

import Foundation
import SwiftUI
import Combine

class ImageLoadingViewModel: ObservableObject {
    
    var cancellables = Set<AnyCancellable>()
    
    @Published var image: UIImage? = nil
    
    @Published var isLoading: Bool = false
    
    let urlString: String
    
    init(url: String) {
        urlString = url
        downloadImage()
    }
    
    func downloadImage() {
        print("Download a image...\(UUID().uuidString)")
        
        isLoading = true
        
        guard let url = URL(string: urlString) else {
            isLoading = false
            return
        }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map { data, response -> UIImage? in
                return UIImage(data: data)
            }
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.isLoading = false
            } receiveValue: { [weak self] returnedImage in
                self?.image = returnedImage
            }
            .store(in: &cancellables)

    }
}
