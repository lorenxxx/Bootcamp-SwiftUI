//
//  Images.swift
//  Bootcamp-SwiftUI
//
//  Created by lorenliang on 2023/12/8.
//

import SwiftUI

struct ImagesBootcamp: View {
    var body: some View {
        Image("lorenliang")
            //.renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
            .resizable()
            //.aspectRatio(contentMode: .fit)
            .scaledToFit()
            .frame(width: 300, height: 300)
            //.cornerRadius(15)
            .clipShape(
                Circle()
                //RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                //Ellipse()
            )
    }
}

#Preview {
    ImagesBootcamp()
}
