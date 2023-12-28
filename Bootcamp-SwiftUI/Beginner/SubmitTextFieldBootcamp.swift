//
//  SubmitTextFieldBootcamp.swift
//  Bootcamp-SwiftUI
//
//  Created by lorenliang on 2023/12/14.
//

import SwiftUI

struct SubmitTextFieldBootcamp: View {
    
    @State private var text: String = ""
    
    var body: some View {
        VStack {
            TextField("Type something ...", text: $text)
                .submitLabel(.search)
                .onSubmit {
                    print("Do something...")
                }
        }
        .padding()
    }
}

#Preview {
    SubmitTextFieldBootcamp()
}
