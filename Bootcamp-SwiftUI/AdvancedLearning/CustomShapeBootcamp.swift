//
//  CustomShapeBootcamp.swift
//  Bootcamp-SwiftUI
//
//  Created by lorenliang on 2023/12/27.
//

import SwiftUI

struct CustomShapeBootcamp: View {
    var body: some View {
        ZStack {
            Triangle()
                //.trim(from: 0.0, to: 0.5)
                .fill(.linearGradient(colors: [.pink, .orange], startPoint: .leading, endPoint: .trailing))
                .frame(width: 300, height: 300)
        }
    }
}

struct Triangle: Shape {
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        }
    }
    
}

#Preview {
    CustomShapeBootcamp()
}
