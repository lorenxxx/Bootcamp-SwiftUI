//
//  AnyTransitionBootcamp.swift
//  Bootcamp-SwiftUI
//
//  Created by lorenliang on 2023/12/26.
//

import SwiftUI

struct AnyTransitionBootcamp: View {
    
    @State private var showRectangle: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            
            if showRectangle {
                RoundedRectangle(cornerRadius: 25.0)
                    .frame(width: 250, height: 350)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .transition(AnyTransition.rotating.animation(.easeInOut))
            }
            
            Spacer()
            
            Text("Click Me!")
                .withDefaultButtomFormatting(backgroundColor: .blue)
                .padding(.horizontal, 40)
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        showRectangle.toggle()
                    }
                }
        }
    }
}

struct RotationViewModifier: ViewModifier {
    
    let rotation: Double
    
    func body(content: Content) -> some View {
        content.rotationEffect(Angle(degrees: rotation))
    }
    
}

extension AnyTransition {
    
    static var rotating: AnyTransition {
        return AnyTransition.modifier(
            active: RotationViewModifier(rotation: 180),
            identity: RotationViewModifier(rotation: 0)
        )
    }
    
}

#Preview {
    AnyTransitionBootcamp()
}
