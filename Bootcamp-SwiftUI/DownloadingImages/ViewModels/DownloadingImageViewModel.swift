//
//  DownloadingImageViewModel.swift
//  Bootcamp-SwiftUI
//
//  Created by loren on 2023/12/23.
//

import Foundation
import Combine

class DownloadingImageViewModel: ObservableObject {
    
    let dataService = PhotoModelDataService.instance
    
    var cancellables = Set<AnyCancellable>()
    
    @Published var dataArray: [PhotoModel] = []
    
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        dataService.$photoModel
            .sink { [weak self] returnedPhotoModels in
                self?.dataArray = returnedPhotoModels
            }
            .store(in: &cancellables)
    }
    
}
