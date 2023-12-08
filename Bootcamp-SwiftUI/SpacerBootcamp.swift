//
//  SpacerBootcamp.swift
//  Bootcamp-SwiftUI
//
//  Created by loren on 2023/12/8.
//

import SwiftUI

struct SpacerBootcamp: View {
    var body: some View {
//        HStack(spacing: 0) {
//            Spacer()
//                .frame(height: 10)
//                .background(Color.gray)
//            
//            Rectangle()
//                .frame(width: 50, height: 50)
//            
//            Spacer()
//                .frame(height: 10)
//                .background(Color.gray)
//            
//            Rectangle()
//                .fill(Color.red)
//                .frame(width: 50, height: 50)
//            
//            Spacer()
//                .frame(height: 10)
//                .background(Color.gray)
//            
//            Rectangle()
//                .fill(Color.green)
//                .frame(width: 50, height: 50)
//            
//            Spacer()
//                .frame(height: 10)
//                .background(Color.gray)
//        }
//        .padding(.horizontal, 200)
        //.background(Color.blue)
        
        VStack {
            HStack {
                Image(systemName: "xmark")
                    
                Spacer()
                    .frame(height: 10)
                    .background(Color.gray)
                
                Image(systemName: "gear")
                    
            }
            .font(.title)
            //.background(Color.yellow)
            .padding(.horizontal)
            //.background(Color.blue)
            
            Spacer()
                .frame(width: 10)
                .background(Color.gray)
            
            Rectangle()
                .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
        }
        .background(Color.yellow)
    }
}

#Preview {
    SpacerBootcamp()
}
