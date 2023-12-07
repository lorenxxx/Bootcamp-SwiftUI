//
//  GradientsBootcamp.swift
//  Bootcamp-SwiftUI
//
//  Created by loren on 2023/12/7.
//

import SwiftUI

struct GradientsBootcamp: View {
    var body: some View {
        RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
            .fill(
                //.red
//                LinearGradient(
//                    gradient: Gradient(colors: [Color.green, Color.blue]),
//                    startPoint: .topLeading,
//                    endPoint: .bottom
//                )
//                RadialGradient(
//                    gradient: Gradient(colors: [Color.green, Color.blue]),
//                    center: .topLeading,
//                    startRadius: 5,
//                    endRadius: 400)
                AngularGradient(
                    gradient: Gradient(colors: [Color.green, Color.blue]),
                    center: .topLeading,
                    angle: .degrees(180 + 45))
            )
            .frame(width: 300, height: 200)
    }
}

#Preview {
    GradientsBootcamp()
}
