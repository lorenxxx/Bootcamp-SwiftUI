//
//  FocusState.swift
//  Bootcamp-SwiftUI
//
//  Created by lorenliang on 2023/12/14.
//

import SwiftUI

struct FocusStateBootcamp: View {
    
    @State private var username: String = ""
    
    @State private var password: String = ""
    
    @FocusState private var usernameInFocus: Bool
    
    @FocusState private var passwordInFocus: Bool
    
    var body: some View {
        VStack(spacing: 20) {
            TextField("Add your name here...", text: $username)
                .focused($usernameInFocus)
                .padding(.leading)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(.gray.opacity(0.2))
                .cornerRadius(10.0)
            
            SecureField("Add your password here...", text: $password)
                .focused($passwordInFocus)
                .padding(.leading)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(.gray.opacity(0.2))
                .cornerRadius(10.0)
            
            Button("Sign up".uppercased()) {
                if username.isEmpty {
                    usernameInFocus = true
                    return
                }
                
                if password.isEmpty {
                    passwordInFocus = true
                    return
                }
                
                // SIGN UP...
                print("SIGN UP...")
            }
            
//            Button("Toggle focus state".uppercased()) {
//                usernameInFocus.toggle()
//            }
        }
        .padding()
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.usernameInFocus = true
            }
        })
    }
    
}

#Preview {
    FocusStateBootcamp()
}
