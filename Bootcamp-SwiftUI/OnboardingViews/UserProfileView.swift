//
//  UserProfileView.swift
//  Bootcamp-SwiftUI
//
//  Created by loren on 2023/12/13.
//

import SwiftUI

struct UserProfileView: View {
    
    // app storage
    @AppStorage("signed_in") var currentUserSignedIn: Bool = false
    
    @AppStorage("name") var currentUserName: String?
    
    @AppStorage("age") var currentUserAge: Int?
    
    @AppStorage("gender") var currentUserGender: String?
    
    var body: some View {
        ZStack {
            // background
            RadialGradient(
                colors: [.yellow, .pink],
                center: .topLeading,
                startRadius: 0,
                endRadius: UIScreen.main.bounds.height
            )
            .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                
                Text(currentUserName ?? "Your name here")
                Text("\(currentUserAge ?? 0) years old")
                Text("\(currentUserGender ?? "unknow")")
                
                Text("SIGN OUT")
                    .foregroundStyle(.white)
                    .font(.headline)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(.black)
                    .cornerRadius(15.0)
                    .onTapGesture(perform: {
                        signOut()
                    })
                
            }
            .font(.headline)
            .foregroundStyle(.pink)
            .padding()
            .background(.white)
                .ignoresSafeArea()
            .cornerRadius(15.0)
            .shadow(radius: 20)
            .padding()
            .padding(.horizontal, 20)
        }
    }
    
    func signOut() {
        currentUserName = nil
        currentUserAge = nil
        currentUserGender = nil
        
        withAnimation(.spring) {
            currentUserSignedIn = false
        }
    }
}

#Preview {
    UserProfileView()
}
