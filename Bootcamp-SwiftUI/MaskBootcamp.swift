//
//  MaskBootcamp.swift
//  Bootcamp-SwiftUI
//
//  Created by loren on 2023/12/19.
//

import SwiftUI

struct MaskBootcamp: View {
    
    @State var rating: Int = 3
    
    var body: some View {
        ZStack {
            starsView.overlay { overlayView.mask { starsView }}
        }
    }
    
    private var starsView: some View {
        HStack {
            ForEach(1..<6) { index in
                Image(systemName: "star.fill")
                    .font(.largeTitle)
                    .foregroundStyle(.gray)
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            rating = index
                        }
                    }
            }
        }
    }
    
    private var overlayView: some View {
        GeometryReader(content: { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    //.foregroundStyle(.yellow)
                    .foregroundStyle(LinearGradient(colors: [.yellow, .red], startPoint: .leading, endPoint: .trailing))
                    .frame(width: CGFloat(rating) / 5 * geometry.size.width)
            }
        })
        .allowsHitTesting(false)
    }
}

#Preview {
    MaskBootcamp()
}
