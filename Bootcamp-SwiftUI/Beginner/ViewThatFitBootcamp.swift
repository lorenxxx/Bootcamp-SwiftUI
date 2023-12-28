//
//  ViewThatFitBootcamp.swift
//  Bootcamp-SwiftUI
//
//  Created by loren on 2023/12/14.
//

import SwiftUI

struct ViewThatFitBootcamp: View {
    var body: some View {
        ZStack {
            Color.pink
                .ignoresSafeArea()
            
            ViewThatFits {
                Text("This is some text that I would like to display to the user!")
                Text("This is some text that I would like to display!")
                Text("This is some text!")
            }

            //.lineLimit(1)
            //.minimumScaleFactor(0.3)
        }
        .frame(height: 300)
        .padding(16)
        .font(.headline)
    }
}

#Preview {
    ViewThatFitBootcamp()
}
