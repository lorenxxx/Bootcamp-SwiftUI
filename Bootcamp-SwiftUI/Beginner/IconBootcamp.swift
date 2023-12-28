//
//  IconBootcamp.swift
//  Bootcamp-SwiftUI
//
//  Created by lorenliang on 2023/12/8.
//

import SwiftUI

struct IconBootcamp: View {
    var body: some View {
        Image(systemName: "pencil.circle.fill")
            .renderingMode(.original)
            .resizable()
            //.aspectRatio(contentMode: .fit)
            .scaledToFill()
            //.font(.largeTitle)
            //.font(.system(size: 300))
            //.foregroundColor(.green)
            .frame(width: 200, height: 200)
            //.clipped()
    }
}

#Preview {
    IconBootcamp()
}
