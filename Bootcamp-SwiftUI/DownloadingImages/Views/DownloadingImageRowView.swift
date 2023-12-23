//
//  DownloadingImageRowView.swift
//  Bootcamp-SwiftUI
//
//  Created by loren on 2023/12/23.
//

import SwiftUI

struct DownloadingImageRowView: View {
    
    let model: PhotoModel
    
    var body: some View {
        HStack {
            DownloadingImageView(url: model.url)
                .frame(width: 75, height: 75)
            
            VStack(alignment: .leading) {
                Text(model.title)
                    .font(.headline)
                
                Text(model.url)
                    .foregroundStyle(.gray)
                    .italic()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    DownloadingImageRowView(
        model: PhotoModel(
            id: 1,
            albumId: 1,
            title: "Title Here",
            url: "https://via.placeholder.com/600/92c952",
            thumbnailUrl: "thumbnailUrl here"
        )
    )
    .padding()
    .previewLayout(.sizeThatFits)
}
