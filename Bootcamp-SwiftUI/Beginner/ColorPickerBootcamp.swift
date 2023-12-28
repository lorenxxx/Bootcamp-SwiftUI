//
//  ColorPicker.swift
//  Bootcamp-SwiftUI
//
//  Created by lorenliang on 2023/12/12.
//

import SwiftUI

struct ColorsPickerBootcamp: View {
    
    @State var bgColor: Color = Color.green
    
    var body: some View {
        ZStack {
            bgColor
                .ignoresSafeArea()
            
            ColorPicker(
                "Select a color",
                selection: $bgColor,
                supportsOpacity: true)
            .padding()
            .background(Color.black)
            .cornerRadius(10.0)
            .foregroundStyle(Color.white)
            .font(.headline)
            .padding(50)
        }
    }
}

#Preview {
    ColorsPickerBootcamp()
}
