//
//  SliderBootcamp.swift
//  Bootcamp-SwiftUI
//
//  Created by lorenliang on 2023/12/12.
//

import SwiftUI

struct SliderBootcamp: View {
    
    @State var sliderValue: Double = 3
    
    @State var color: Color = .red
    
    var body: some View {
        VStack {
            Text("Slider Value: ")
            Text(
                //"\(sliderValue)"
                String(format: "%.1f", sliderValue)
            )
            .foregroundStyle(color)
            
//            Slider(value: $sliderValue)
//                .accentColor(.orange)
            
//            Slider(value: $sliderValue, in: 0...5)
            
//            Slider(value: $sliderValue, in: 0...5, step: 0.5)
//                .padding()
            
            Slider(
                value: $sliderValue,
                in: 1...5,
                step: 0.5) {
                    Text("Title")
                } minimumValueLabel: {
                    Text("1")
                        .font(.headline)
                        .foregroundStyle(.green)
                } maximumValueLabel: {
                    Text("5")
                        .font(.headline)
                        .foregroundStyle(.red)
                } onEditingChanged: { _ in
                    color = .green
                }
                .padding()
        }
    }
}

#Preview {
    SliderBootcamp()
}
