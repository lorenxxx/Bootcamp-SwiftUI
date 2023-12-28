//
//  AsyncImageBootcamp.swift
//  Bootcamp-SwiftUI
//
//  Created by loren on 2023/12/14.
//

import SwiftUI

struct AsyncImageBootcamp: View {
    
    let url = URL(string: "https://picsum.photos/seed/picsum/400/400")
    
    var body: some View {
        if #available(iOS 15.0, *) {
            //AsyncImage(url: url)
            
            //            AsyncImage(url: url) { returnImage in
            //                returnImage
            //                    .resizable()
            //                    .scaledToFit()
            //                    .frame(width: 300, height: 300)
            //                    .cornerRadius(15)
            //            } placeholder: {
            //                ProgressView()
            //            }
            
            AsyncImage(url: url) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
                        .cornerRadius(15)
                case .failure:
                    Image(systemName: "camera.metering.unknown")
                        .font(.headline)
                default:
                    Image(systemName: "questionmark")
                        .font(.headline)
                }
            }
            
        } else {
            
        }
    }
}

#Preview {
    AsyncImageBootcamp()
}
