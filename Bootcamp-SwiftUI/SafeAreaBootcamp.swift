//
//  SafeAreaBootcamp.swift
//  Bootcamp-SwiftUI
//
//  Created by loren on 2023/12/9.
//

import SwiftUI

struct SafeAreaBootcamp: View {
    var body: some View {
        //        ZStack {
        //            // background
        //            Color.blue
        //                .edgesIgnoringSafeArea(.all)
        //
        //            // foreground
        //            VStack {
        //                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        //
        //                Spacer()
        //            }
        //            .frame(maxWidth: .infinity, maxHeight: .infinity)
        //            .background(Color.red)
        //        }
        
        
        ScrollView {
            VStack {
                Text("Title goes here")
                    .font(.largeTitle)
                    .frame(maxWidth: .infinity, alignment: .leading)
                ForEach(0..<10) { index in
                    RoundedRectangle(cornerRadius: 25.0)
                        .fill(.white)
                        .frame(height: 150)
                        .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 10, x: 0.0, y: 0.0)
                        .padding(20)
                }
            }
        }
        .background(
            Color.red
                //.edgesIgnoringSafeArea(.all) // old, deprecated
                .ignoresSafeArea(edges: .all)  // new
        )
    }
}

#Preview {
    SafeAreaBootcamp()
}
