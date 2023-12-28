//
//  TernaryBootcamp.swift
//  Bootcamp-SwiftUI
//
//  Created by loren on 2023/12/10.
//

import SwiftUI

struct TernaryBootcamp: View {
    
    @State var isStartingState: Bool = false
    
    var body: some View {
        VStack {
            Button("Button") {
                isStartingState.toggle()
            }
            
            RoundedRectangle(cornerRadius: 25.0)
                .fill(isStartingState ? Color.green : Color.pink)
                .frame(width: 200, height: 100)
            
            Spacer()
        }
    }
}

#Preview {
    TernaryBootcamp()
}
