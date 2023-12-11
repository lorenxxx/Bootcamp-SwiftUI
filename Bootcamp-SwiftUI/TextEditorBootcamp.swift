//
//  TextEditorBootcamp.swift
//  Bootcamp-SwiftUI
//
//  Created by loren on 2023/12/11.
//

import SwiftUI

struct TextEditorBootcamp: View {
    
    @State var textEditorText: String = ""
    
    @State var savedText: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                TextEditor(text: $textEditorText)
                    .frame(height: 250)
                    .foregroundColor(.black)
                    .colorMultiply(.gray.opacity(0.3))  // ?
                    .cornerRadius(15.0)
                
                Button(action: {
                    savedText = textEditorText
                    textEditorText = ""
                }, label: {
                    Text("Save".uppercased())
                        .font(.headline)
                        .foregroundStyle(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(15.0)
                })
                
                Text(savedText)
                
                Spacer()
            }
            .padding()
            //.background(Color.pink)
            .navigationTitle("TextEditor")
        
        }
    }
}

#Preview {
    TextEditorBootcamp()
}
