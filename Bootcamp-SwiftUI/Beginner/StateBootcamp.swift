//
//  StateBootcamp.swift
//  Bootcamp-SwiftUI
//
//  Created by loren on 2023/12/9.
//

import SwiftUI

struct StateBootcamp: View {
    
    @State var bgColor: Color = Color.green
    
    @State var count: Int = 0
    
    var body: some View {
        ZStack {
            // background
            bgColor
                .ignoresSafeArea()
            
            // content
            VStack(spacing: 20) {
                Text("Title")
                    .font(.title)
                
                Text("Count: \(count)")
                    .font(.headline)
                    .underline()
                
                HStack(spacing: 20) {
                    Button("Button 1") {
                        bgColor = Color.red
                        count += 1
                    }
                    
                    Button("Button 2") {
                        bgColor = Color.purple
                        count += 2
                    }
                }
            }
            .foregroundStyle(Color.white)
        }
    }
}

#Preview {
    StateBootcamp()
}
