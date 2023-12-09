//
//  ButtonBootcamp.swift
//  Bootcamp-SwiftUI
//
//  Created by loren on 2023/12/9.
//

import SwiftUI

struct ButtonBootcamp: View {
    
    @State var title: String = "This is my title"
    
    var body: some View {
        VStack(spacing: 20) {
            Text(title)
            Button("Press me!") {
                self.title = "Button #2 was pressed"
            }
            .accentColor(.red)
            
            Button(action: {
                self.title = "Button #2 was pressed"
            }, label: {
                Text("Button")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.white)
                    .padding()
                    .padding(.horizontal, 20)
                    .background(
                        Color.blue
                            .cornerRadius(10)
                            .shadow(color: .black, radius: 10, x: 0.0, y: 0.0)
                    )
            })
            
            Button(action: {
                self.title = "Button #3 was pressed"
            }, label: {
                Circle()
                    .fill(.white)
                    .frame(width: 75, height: 75)
                    .shadow(radius: 10)
                    .overlay {
                        Image(systemName: "heart.fill")
                            .font(.largeTitle)
                            .foregroundColor(.red)
                    }
            })
            
            Button(action: {
                self.title = "Button #4 was pressed"
            }, label: {
                Text("Finish".uppercased())
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.gray)
                    .padding()
                    .padding(.horizontal, 10)
                    .background(
                        Capsule()
                            .stroke(.gray, lineWidth: 3.0)
                    )
            })
        }
    }
}

#Preview {
    ButtonBootcamp()
}
