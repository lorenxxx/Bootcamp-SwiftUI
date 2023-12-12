//
//  ModelBootcamp.swift
//  Bootcamp-SwiftUI
//
//  Created by loren on 2023/12/12.
//

import SwiftUI

struct UserModel: Identifiable{
    let id: String = UUID().uuidString
    let displayName: String
    let userName: String
    let followerCount: Int
    let isVerified: Bool
}

struct ModelBootcamp: View {
    
    @State var users: [UserModel] = [
        UserModel(displayName: "Loren L", userName: "loren1991", followerCount: 8888, isVerified: true),
        UserModel(displayName: "Jach C", userName: "jack1992", followerCount: 17, isVerified: true),
        UserModel(displayName: "Nick Z", userName: "nick1985", followerCount: 118, isVerified: true),
        UserModel(displayName: "Chris H", userName: "chris2007", followerCount: 2218, isVerified: false)
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(users) { user in
                    HStack(spacing: 15.0) {
                        Circle()
                            .frame(width: 35, height: 35)
                        
                        VStack(alignment: .leading) {
                            Text(user.displayName)
                                .font(.headline)
                            Text("@\(user.userName)")
                                .foregroundStyle(.gray)
                                .font(.caption)
                        }
                        
                        Spacer()
                        
                        if user.isVerified {
                            Image(systemName: "checkmark.seal.fill")
                                .foregroundStyle(.blue)
                        }
                        
                        VStack {
                            Text("\(user.followerCount)")
                                .font(.headline )
                            Text("Followers")
                                .foregroundStyle(.gray)
                                .font(.caption)
                        }
                        
                    }
                    .padding(.vertical, 5)
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Users")
        }
    }
}

#Preview {
    ModelBootcamp()
}
