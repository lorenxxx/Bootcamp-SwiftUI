//
//  MagnificationGestureBootcamp.swift
//  Bootcamp-SwiftUI
//
//  Created by lorenliang on 2023/12/19.
//

import SwiftUI

struct MagnificationGestureBootcamp: View {
    
    @State var currentAmout: CGFloat = 0.0
    
    @State var lastAmount: CGFloat = 0.0
    
    var body: some View {
//        Text("Hello, World!")
//            .font(.title)
//            .padding(40)
//            .background(.red)
//            .clipShape(RoundedRectangle(cornerRadius: 10.0))
//            .scaleEffect(1.0 + currentAmout + lastAmount)
//            .gesture(
//                MagnificationGesture()
//                    .onChanged { value in
//                        currentAmout = value - 1
//                    }
//                    .onEnded { value in
//                        lastAmount += currentAmout
//                        currentAmout = 0
//                    }
//            )
        
        VStack(spacing: 10) {
            HStack {
                Circle().frame(width: 35, height: 35)
                Text("LorenLiang")
                
                Spacer()
                
                Image(systemName: "ellipsis")
            }
            .padding(.horizontal)
            
            Rectangle().frame(height: 300)
                .scaleEffect(1.0 + currentAmout)
                .gesture(
                    MagnificationGesture()
                        .onChanged({ value in
                            currentAmout = value - 1
                        })
                        .onEnded({ value in
                            withAnimation(.spring) {
                                currentAmout = 0
                            }
                        })
                )
            
            HStack {
                Image(systemName: "heart.fill")
                Image(systemName: "text.bubble.fill")
                
                Spacer()
            }
            .padding(.horizontal)
            .font(.headline)
        }
            
    }
}

#Preview {
    MagnificationGestureBootcamp()
}
