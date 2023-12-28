//
//  RotationGestureBootcamp.swift
//  Bootcamp-SwiftUI
//
//  Created by lorenliang on 2023/12/19.
//

import SwiftUI

struct RotationGestureBootcamp: View {
    
    @State var angle: Angle = Angle(degrees: 0.0)
    
    var body: some View {
        Text("Hello, World!")
            .font(.title)
            .fontWeight(.bold)
            .foregroundStyle(.white)
            .padding(50)
            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10.0))
            .rotationEffect(angle)
            .gesture(
                RotationGesture()
                    .onChanged({ value in
                        angle = value
                    })
                    .onEnded({ value in
                        withAnimation(.spring) {
                            angle = Angle(degrees: 0.0)
                        }
                    })
            )
    }
}

#Preview {
    RotationGestureBootcamp()
}
