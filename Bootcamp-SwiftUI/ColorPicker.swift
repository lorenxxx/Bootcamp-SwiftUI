//
//  ColorPicker.swift
//  Bootcamp-SwiftUI
//
//  Created by lorenliang on 2023/12/12.
//

import SwiftUI

struct ColorPicker: View {
    
    @State var backgroundColor: Color = Color.green
    
    var body: some View {
        ZStack {
            backgroundColor
                .ignoresSafeArea()
            
//            ColorPicker("Select a color",
//                        selection: $backgroundColor,
//                        supportsOpacity: true)
        }
    }
}

#Preview {
    ColorPicker()
}
