//
//  MenuBootcamp.swift
//  Bootcamp-SwiftUI
//
//  Created by loren on 2023/12/14.
//

import SwiftUI

struct MenuBootcamp: View {
    var body: some View {
        Menu("Click Me") {
            Button("Button 1") {
                
            }
            Button("Button 2") {
                
            }
            Button("Button 3") {
                
            }
            Menu("Inside Click") {
                Button("Button 4") {
                    
                }
                Button("Button 5") {
                    
                }
            }
        }
    }
}

#Preview {
    MenuBootcamp()
}
