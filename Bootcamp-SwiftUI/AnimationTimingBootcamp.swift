//
//  AnimationTimingBootcamp.swift
//  Bootcamp-SwiftUI
//
//  Created by loren on 2023/12/10.
//

import SwiftUI

struct AnimationTimingBootcamp: View {
    
    @State var isAnimating: Bool = false
    
    var body: some View {
        VStack {
            Button("Button") {
                isAnimating.toggle()
            }
            
            RoundedRectangle(cornerRadius: 25.0)
                .fill(.pink)
                .frame(width: isAnimating ? 350 : 50, height: 100)
                .animation(.default, value: isAnimating)
            
            RoundedRectangle(cornerRadius: 25.0)
                .fill(.pink)
                .frame(width: isAnimating ? 350 : 50, height: 100)
                .animation(.spring(), value: isAnimating)
            
            RoundedRectangle(cornerRadius: 25.0)
                .fill(.pink)
                .frame(width: isAnimating ? 350 : 50, height: 100)
                .animation(.spring(
                    response: 1.0,
                    dampingFraction: 0.2,
                    blendDuration: 1.0
                ), value: isAnimating)
            
            //            RoundedRectangle(cornerRadius: 25.0)
            //                .fill(.pink)
            //                .frame(width: isAnimating ? 350 : 50, height: 100)
            //                .animation(.linear(duration: 5.0), value: isAnimating)
            //
            //            RoundedRectangle(cornerRadius: 25.0)
            //                .fill(.pink)
            //                .frame(width: isAnimating ? 350 : 50, height: 100)
            //                .animation(.easeIn, value: isAnimating)
            //
            //            RoundedRectangle(cornerRadius: 25.0)
            //                .fill(.pink)
            //                .frame(width: isAnimating ? 350 : 50, height: 100)
            //                .animation(.easeInOut, value: isAnimating)
            //
            //            RoundedRectangle(cornerRadius: 25.0)
            //                .fill(.pink)
            //                .frame(width: isAnimating ? 350 : 50, height: 100)
            //                .animation(.easeOut, value: isAnimating)
        }
    }
}

#Preview {
    AnimationTimingBootcamp()
}
