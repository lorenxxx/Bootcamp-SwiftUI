//
//  StepperBootcamp.swift
//  Bootcamp-SwiftUI
//
//  Created by lorenliang on 2023/12/12.
//

import SwiftUI

struct StepperBootcamp: View {
    
    @State var stepperValue: Int = 10
    
    @State var widthIncrement: CGFloat = 0
    
    var body: some View {
        VStack {
            Stepper("Stepper: \(stepperValue)", value: $stepperValue)
                .padding()
            
            RoundedRectangle(cornerRadius: 25.0)
                .frame(width: 100 + widthIncrement, height: 100)
            
            Stepper("Stepper 2:") {
                withAnimation(.easeInOut) {
                    widthIncrement += 10.0
                }
            } onDecrement: {
                withAnimation(.easeInOut) {
                    widthIncrement -= 10.0
                }
            }
            .padding()
        }
    }
}

#Preview {
    StepperBootcamp()
}
