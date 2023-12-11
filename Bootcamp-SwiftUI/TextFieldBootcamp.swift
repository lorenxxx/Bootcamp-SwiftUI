//
//  TextfieldBootcamp.swift
//  Bootcamp-SwiftUI
//
//  Created by lorenliang on 2023/12/11.
//

import SwiftUI

struct TextFieldBootcamp: View {
    
    @State var textFieldText: String = ""
    
    @State var dataArray: [String] = []
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Type something here...", text: $textFieldText)
                    //.textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .background(Color.gray.opacity(0.2).cornerRadius(10.0))
                    //.foregroundColor(.red)
                    .font(.headline)
                
                Button(action: {
                    if checkText() {
                        saveText()
                    }
                }, label: {
                    Text("Save".uppercased())
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(checkText() ? Color.blue : Color.gray)
                        .cornerRadius(10.0)
                        .foregroundColor(.white)
                        .font(.headline)
                })
                .disabled(!checkText())
                
                ForEach(dataArray, id: \.self) { item in
                    Text(item)
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("Bootcamp")
        }
    }
    
    func checkText() -> Bool {
        return textFieldText.count >= 3
    }
    
    func saveText() {
        dataArray.append(textFieldText)
        textFieldText = ""
    }
}

#Preview {
    TextFieldBootcamp()
}
