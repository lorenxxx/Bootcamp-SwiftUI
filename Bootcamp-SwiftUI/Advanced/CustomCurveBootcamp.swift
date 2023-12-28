//
//  CustomCurveBootcamp.swift
//  Bootcamp-SwiftUI
//
//  Created by lorenliang on 2023/12/28.
//

import SwiftUI

struct CustomCurveBootcamp: View {
    var body: some View {
        ArcSample()
            .stroke(lineWidth: 5.0)
            .frame(width: 200, height: 200)
    }
}

struct ArcSample: Shape {
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.midX, y: rect.midY))
            path.addArc(
                center: CGPoint(x: rect.midX, y: rect.midY),
                radius: rect.height / 2,
                startAngle: Angle(degrees: -20),
                endAngle: Angle(degrees: 20),
                clockwise: true
            )
        }
    }
    
}

#Preview {
    CustomCurveBootcamp()
}
