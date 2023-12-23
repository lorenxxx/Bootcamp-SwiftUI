//
//  DownloadingImageBootcamp.swift
//  Bootcamp-SwiftUI
//
//  Created by loren on 2023/12/23.
//

import SwiftUI

struct DownloadingImageBootcamp: View {
    
    @StateObject var vm = DownloadingImageViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(vm.dataArray) { model in
                    DownloadingImageRowView(model: model)
                }
            }
            .listStyle(.plain)
            .navigationTitle("D...Images")
        }
    }
}



#Preview {
    DownloadingImageBootcamp()
}
