//
//  ShapesBootcamp.swift
//  Bootcamp-SwiftUI
//
//  Created by loren on 2023/12/6.
//

import SwiftUI

struct ShapeBootcamp: View {
    var body: some View {
        //Circle()
        //Ellipse()
        //Capsule()
        //Rectangle()
        RoundedRectangle(cornerRadius: 10)
            //.fill(.red)
            //.foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            //.stroke()
            //.stroke(/*@START_MENU_TOKEN@*/Color.blue/*@END_MENU_TOKEN@*/)
            //.stroke(.green, lineWidth: 12)
            //.stroke(.orange, style: StrokeStyle(lineWidth: 30, lineCap: .round, dash: [30]))
            //.trim(from: 0.2, to: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
            .stroke(.green, lineWidth: 5)
            .frame(width: 300, height: 200)
    }
}

#Preview {
    ShapeBootcamp()
}
