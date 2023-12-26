//
//  ButtonStyleBootcamp.swift
//  Bootcamp-SwiftUI
//
//  Created by lorenliang on 2023/12/26.
//

import SwiftUI

struct CustomButtonStyleBootcamp: View {
    var body: some View {
        Button {
            
        } label: {
            Text("Click Me")
                .font(.headline)
                .foregroundStyle(.white)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(.blue)
                .clipShape(RoundedRectangle(cornerRadius: 10.0))
                .shadow(color: .blue.opacity(0.3), radius: 10, x: 0.0, y: 10.0)
                .padding()
        }
        //.buttonStyle(PressableButtonStyle(scaleAmount: 0.6))
        .withPressableStyle(scaleAmount: 0.5)
        .padding(40.0)
    }
}

struct PressableButtonStyle: ButtonStyle {
    
    let scaleAmount: CGFloat
    
    init(scaleAmount: CGFloat = 0.9) {
        self.scaleAmount = scaleAmount
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .opacity(configuration.isPressed ? 0.9 : 1.0)
            .brightness(configuration.isPressed ? 0.1 : 0.0)
            .scaleEffect(configuration.isPressed ? scaleAmount : 1.0)
    }
}

extension View {
    
    func withPressableStyle(scaleAmount: CGFloat) -> some View {
        buttonStyle(PressableButtonStyle(scaleAmount: scaleAmount))
    }
    
}

#Preview {
    CustomButtonStyleBootcamp()
}
