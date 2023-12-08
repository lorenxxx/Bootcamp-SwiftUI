//
//  StackBootcamp.swift
//  Bootcamp-SwiftUI
//
//  Created by lorenliang on 2023/12/8.
//

import SwiftUI

struct StackBootcamp: View {
    // VStack -> Vertical
    // HStack -> Horizontal
    // ZStack -> zIndex (back to front)
    
    var body: some View {
//        VStack {
//            Rectangle()
//                .fill(.red)
//                .frame(width: 100, height: 100)
//            
//            Rectangle()
//                .fill(.green)
//                .frame(width: 100, height: 100)
//            
//            Rectangle()
//                .fill(.orange)
//                .frame(width: 100, height: 100)
//        }
        
//        ZStack(alignment: .bottomTrailing, content: {
//            Rectangle()
//                .fill(.red)
//                .frame(width: 200, height: 200)
//            
//            Rectangle()
//                .fill(.green)
//                .frame(width: 150, height: 150)
//            
//            Rectangle()
//                .fill(.orange)
//                .frame(width: 100, height: 100)
//        })
        
//        ZStack(alignment: .top) {
//            Rectangle()
//                .fill(.yellow)
//                .frame(width: 350, height: 500)
//            
//            VStack(alignment: .leading, spacing: 20.0) {
//                Rectangle()
//                    .fill(.red)
//                    .frame(width: 150, height: 150)
//                Rectangle()
//                    .fill(.green)
//                    .frame(width: 100, height: 100)
//                HStack(alignment: .bottom) {
//                    Rectangle()
//                        .fill(.purple)
//                    .frame(width: 50, height: 50)
//                    Rectangle()
//                        .fill(.pink)
//                    .frame(width: 30, height: 30)
//                    Rectangle()
//                        .fill(.brown)
//                    .frame(width: 10, height: 10)
//                }
//                .background(.white)
//            }
//            .background(.black)
//        }
        
//        VStack(alignment: .center, spacing: 20) {
//            Text("5")
//                .font(.largeTitle)
//                .underline()
//            
//            Text("Items in your car:")
//                .foregroundColor(.gray)
//                .font(.caption)
//        }
        
        VStack(spacing: 50) {
            ZStack {
                Circle()
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                Text("1")
                    .font(.title)
                    .foregroundColor(.white)
            }
            
            Text("1")
                .font(.title)
                .foregroundColor(.white)
                .background(
                    Circle()
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                )
        }
        
    }
}

#Preview {
    StackBootcamp()
}
