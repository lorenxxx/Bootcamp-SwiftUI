//
//  TextfieldBootcamp.swift
//  Bootcamp-SwiftUI
//
//  Created by lorenliang on 2023/12/11.
//

import SwiftUI

struct TextfieldBootcamp: View {
    
    @State var textFieldText: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Type something here...", text: $textFieldText)
                    //.textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .background(Color.gray.opacity(0.2).cornerRadius(10.0))
                    .foregroundColor(.red)
                    .font(.headline)
                
                Button(action: {
                     
                }, label: {
                    Text("Save".uppercased())
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue.cornerRadius(10.0))
                        .foregroundColor(.white)
                        .font(.headline)
                })
                
                Spacer()
            }
            .padding()
            .navigationTitle("Bootcamp")
        }
    }
}

#Preview {
    TextfieldBootcamp()
}
