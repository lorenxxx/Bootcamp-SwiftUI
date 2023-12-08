//
//  PaddingAndSpacerBootcamp.swift
//  Bootcamp-SwiftUI
//
//  Created by loren on 2023/12/8.
//

import SwiftUI

struct PaddingAndSpacerBootcamp: View {
    var body: some View {
        //Text("Hello, World! ")
            //.background(Color.yellow)
            // .frame(width: 300, height: 100)
            //.padding()
            //.padding(.horizontal, 10)
            //.background(Color.blue)
            //.font(.largeTitle)
            //.fontWeight(.semibold)
            //.frame(maxWidth: .infinity, alignment: .leading)
            //.background(.red)
            //.padding(.leading, 20)
        
        VStack(alignment: .leading) {
            Text("My Title")
                .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.bottom, 20)
            
            Text("This is the content. This is the content. This is the content. This is the content. This is the content. This is the content. This is the content. This is the content. This is the content.")
        }
        .padding()
        .padding(.vertical, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
        .background(
            Color(.white)
                .cornerRadius(10)
                .shadow(color: .black.opacity(0.3), radius: 10, x: 0.0, y: 10.0)
        )
        .padding(.horizontal, 10)
        
    }
}

#Preview {
    PaddingAndSpacerBootcamp()
}
