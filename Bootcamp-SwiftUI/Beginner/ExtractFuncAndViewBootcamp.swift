//
//  ExtractedFunctionBootcamp.swift
//  Bootcamp-SwiftUI
//
//  Created by loren on 2023/12/9.
//

import SwiftUI

struct ExtractedFunctionBootcamp: View {
    
    @State var bgColor: Color = Color.pink
    
    var body: some View {
        ZStack {
            // background
            bgColor
                .ignoresSafeArea()
            
            // content
            contentLayer
        }
    }
    
    var contentLayer: some View {
        VStack {
            Text("Title")
                .font(.largeTitle)
            
            Button(action: {
                buttonPressed()
            }, label: {
                Text("Press Me")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(10.0)
            })
        }
    }
    
    func buttonPressed() {
        bgColor = Color.yellow
    }
}

#Preview {
    ExtractedFunctionBootcamp()
}
