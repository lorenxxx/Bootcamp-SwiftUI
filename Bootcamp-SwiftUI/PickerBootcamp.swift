//
//  PickerBootcamp.swift
//  Bootcamp-SwiftUI
//
//  Created by loren on 2023/12/11.
//

import SwiftUI

struct PickerBootcamp: View {
    
    @State var selection: String = "2"
    
    var body: some View {
        
        HStack {
            Text("Age: ")
            Text(selection)
        }
        
        VStack {
            Picker("Age Picker", selection: $selection) {
                ForEach(18..<100) { number in
                    Text("\(number)")
                        .font(.headline)
                        .foregroundStyle(.red)
                        .tag("\(number)")
                }
            }
            .pickerStyle(.wheel)
        }
    }
}

#Preview {
    PickerBootcamp()
}
