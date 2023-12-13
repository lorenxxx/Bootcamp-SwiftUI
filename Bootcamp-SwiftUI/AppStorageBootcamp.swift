//
//  AppStorageBootcamp.swift
//  Bootcamp-SwiftUI
//
//  Created by lorenliang on 2023/12/13.
//

import SwiftUI

struct AppStorageBootcamp: View {
    
    //@State var currentUserName: String?
    
    @AppStorage("name") var currentUserName: String?
    
    var body: some View {
        VStack(spacing: 20) {
            Text(currentUserName ?? "Add Name Here")
            
            Button("Save".uppercased()) {
                let name = "LorenL"
                currentUserName = name
                //UserDefaults.standard.setValue(name, forKey: "name")
            }
        }
//        .onAppear(perform: {
//            currentUserName = UserDefaults.standard.string(forKey: "name")
//        })
    }
}

#Preview {
    AppStorageBootcamp()
}
