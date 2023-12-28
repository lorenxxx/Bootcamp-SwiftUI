//
//  TextBootcamp.swift
//  Bootcamp-SwiftUI
//
//  Created by loren on 2023/12/5.
//

import SwiftUI

struct TextBootcamp: View {
    var body: some View {
        Text("Hello, World!".lowercased())
            //.font(.body)
            //.fontWeight(.semibold)
            //.underline()
            //.underline(true, color: .red)
            //.italic()
            //.strikethrough()
            //.strikethrough(true, color: .green)
            //.font(.system(size: 24, weight: .semibold, design: .rounded))
            //.baselineOffset(5.0)
            //.kerning(3.0)
            .multilineTextAlignment(.center)
            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            //.background()
            .frame(width: 300, height: 100, alignment: .trailing)
            .minimumScaleFactor(0.1)
    }
}

#Preview {
    TextBootcamp()
}
