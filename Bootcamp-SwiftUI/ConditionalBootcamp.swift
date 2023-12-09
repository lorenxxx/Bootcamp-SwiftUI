//
//  ConditionalBootcamp.swift
//  Bootcamp-SwiftUI
//
//  Created by loren on 2023/12/9.
//

import SwiftUI

struct ConditionalBootcamp: View {
    
    @State var showCircle: Bool = false
    
    @State var showRectangle: Bool = false
    
    @State var isLoading: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            Button("Circle Button: \(showCircle.description)") {
                showCircle.toggle()
            }
            
            Button("Rectangle Button: \(showRectangle.description)") {
                showRectangle.toggle()
            }
            
            Button("Loading Button: \(isLoading.description)") {
                isLoading.toggle()
            }
            
            if showCircle {
                Circle()
                    .fill(Color.green)
                    .frame(width: 100, height: 100)
            }
            
            if showRectangle {
                Rectangle()
                    .fill(Color.yellow)
                    .frame(width: 150, height: 100)
            }
            
            if showCircle || showRectangle {
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                    .fill(Color.orange)
                    .frame(width: 150, height: 100)
            }
            
            if isLoading {
                ProgressView()
            }
            
            Spacer()
        }
    }
}

#Preview {
    ConditionalBootcamp()
}
