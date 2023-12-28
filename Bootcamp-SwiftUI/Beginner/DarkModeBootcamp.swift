//
//  DarkModeBootcamp.swift
//  Bootcamp-SwiftUI
//
//  Created by lorenliang on 2023/12/12.
//

import SwiftUI

struct DarkModeBootcamp: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    Text("This color is PRIMARY")
                        .foregroundStyle(.primary)
                    
                    Text("This color is SECONDARY")
                        .foregroundStyle(.secondary)
                    
                    Text("This color is BLACK")
                        .foregroundStyle(.black)
                    
                    Text("This color is WHITE")
                        .foregroundStyle(.white)
                    
                    Text("This color is RED")
                        .foregroundStyle(.red)
                    
                    Text("This color is globally adaptive!")
                        .foregroundStyle(Color("AdaptiveColor"))
                    
                    Text("This color is locally adaptive!")
                        .foregroundStyle(colorScheme == .light ? .green : .yellow)
                }
            }
            .navigationTitle("Dark Mode")
        }
    }
}

#Preview {
    DarkModeBootcamp()
}
