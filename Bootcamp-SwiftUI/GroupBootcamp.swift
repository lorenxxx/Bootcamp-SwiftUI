//
//  GroupBootcamp.swift
//  Bootcamp-SwiftUI
//
//  Created by loren on 2023/12/14.
//

import SwiftUI

struct GroupBootcamp: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Hello, World!")
            
            Text("Hello, World!")
            
            Group {
                Text("Hello, World!")
                Text("Hello, World!")
            }
            .font(.title)
            .foregroundStyle(.red)
        }
    }
}

#Preview {
    GroupBootcamp()
}
