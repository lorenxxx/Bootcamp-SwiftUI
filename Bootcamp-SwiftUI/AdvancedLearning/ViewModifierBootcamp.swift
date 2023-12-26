//
//  ViewModifierBootcamp.swift
//  Bootcamp-SwiftUI
//
//  Created by lorenliang on 2023/12/26.
//

import SwiftUI

struct ViewModifierBootcamp: View {
    var body: some View {
        VStack(spacing: 15.0) {
            Text("Hello, World!")
                .font(.largeTitle)
                .modifier(DefaultButtonViewModifier(backgroundColor: .blue))
//                .font(.headline)
//                .foregroundStyle(.white)
//                .frame(height: 55)
//                .frame(maxWidth: .infinity)
//                .background(.blue)
//                .clipShape(RoundedRectangle(cornerRadius: 10.0))
//                .shadow(radius: 10)
//                .padding()
            
            Text("Hello, Again!")
                .font(.title)
                .withDefaultButtomFormatting()
//                .font(.headline)
//                .foregroundStyle(.white)
//                .frame(height: 55)
//                .frame(maxWidth: .infinity)
//                .background(.blue)
//                .clipShape(RoundedRectangle(cornerRadius: 10.0))
//                .shadow(radius: 10)
//                .padding()
            
            Text("Hello, Everyone!")
                .font(.headline)
                //.modifier(DefaultButtonViewModifier())
                .withDefaultButtomFormatting(backgroundColor: .green)
        }
        .padding()
    }
}

struct DefaultButtonViewModifier: ViewModifier {
    
    let backgroundColor: Color
    
    func body(content: Content) -> some View {
        content
            .foregroundStyle(.white)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            //.background(.blue)
            .background(backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: 10.0))
            .shadow(radius: 10)
    }
    
}

extension View {
    
    func withDefaultButtomFormatting(backgroundColor: Color = .gray) -> some View {
        modifier(DefaultButtonViewModifier(backgroundColor: backgroundColor))
    }
    
}

#Preview {
    ViewModifierBootcamp()
}
