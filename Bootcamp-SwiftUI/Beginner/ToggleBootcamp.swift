//
//  ToggleBootcamp.swift
//  Bootcamp-SwiftUI
//
//  Created by loren on 2023/12/11.
//

import SwiftUI

struct ToggleBootcamp: View {
    
    @State var toggleIsOn: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                Text("AirPlane Mode: ")
                Text(toggleIsOn ? "On" : "Off")
            }
            .font(.title)
            
            Toggle(
                isOn: $toggleIsOn,
                label: {
                Text("AirPlane Mode")
            })
            .toggleStyle(SwitchToggleStyle(tint: .red))
            .padding()
            
            Spacer()
        }
    }
}

#Preview {
    ToggleBootcamp()
}
