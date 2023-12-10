//
//  AnimationBootcamp.swift
//  Bootcamp-SwiftUI
//
//  Created by loren on 2023/12/10.
//

import SwiftUI

struct AnimationBootcamp: View {
    
    @State var isAnimated: Bool = false
    
    var body: some View {
        VStack {
//            Button("Button") {
//                withAnimation(
//                    Animation
//                        .default
//                        //.delay(0.5)
//                        .repeatCount(5, autoreverses: false)
//                        //.repeatForever()
//                ) {
//                    isAnimated.toggle()
//                }
//            }
            
            Button("Button") {
                isAnimated.toggle()
            }
            
            Spacer()
            
            RoundedRectangle(cornerRadius: isAnimated ? 50.0 : 25.0)
                .fill(isAnimated ? .blue : .pink)
                .frame(
                    width: isAnimated ? 100 : 300,
                    height: isAnimated ? 100 : 300
                )
                .rotationEffect(Angle(degrees: isAnimated ? 360 : 0))
                .offset(y: isAnimated ? 300 : 0)
                .animation(
                    Animation
                        .default
                        //.delay(0.5)
                        .repeatCount(5, autoreverses: false)
                        //.repeatForever()
                )
            
            Spacer()
        }
    }
}

#Preview {
    AnimationBootcamp()
}
