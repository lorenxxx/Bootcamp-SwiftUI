//
//  AnimateableDataBootcamp.swift
//  Bootcamp-SwiftUI
//
//  Created by lorenliang on 2023/12/28.
//

import SwiftUI

struct AnimateableDataBootcamp: View {
    
    @State var animate: Bool = false
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: animate ? 60.0 : 0)
                .frame(width: 250, height: 250)
        }
        .onAppear(perform: {
            withAnimation(Animation.linear(duration: 2.0).repeatForever()) {
                animate.toggle()
            }
        })
    }
}

#Preview {
    AnimateableDataBootcamp()
}
