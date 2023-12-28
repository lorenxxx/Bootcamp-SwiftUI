//
//  BindingBootcamp.swift
//  Bootcamp-SwiftUI
//
//  Created by loren on 2023/12/9.
//

import SwiftUI

struct BindingBootcamp: View {
    
    @State var bgColor: Color = Color.pink
    
    @State var title: String = "This is title"
    
    var body: some View {
        ZStack {
            bgColor
                .ignoresSafeArea()
            
            VStack {
                Text(title)
                    .foregroundStyle(Color.white)
                
                ButtonView(bgColor: $bgColor, title: $title)
            }
        }
    }
    
}

struct ButtonView: View {
    
    @Binding var bgColor: Color
    
    @State var buttonColor: Color = Color.blue
    
    @Binding var title: String
    
    var body: some View {
        Button(action: {
            bgColor = Color.orange
            buttonColor = Color.black
            title = "My title changed"
        }, label: {
            Text("Button")
                .foregroundStyle(Color.white)
                .padding()
                .padding(.horizontal, 10)
                .background(buttonColor)
                .cornerRadius(10)
        })
    }
    
}

#Preview {
    BindingBootcamp()
}
