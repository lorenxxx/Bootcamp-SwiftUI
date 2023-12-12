//
//  IfLetGuardBootcamp.swift
//  Bootcamp-SwiftUI
//
//  Created by loren on 2023/12/12.
//

import SwiftUI

struct IfLetGuardBootcamp: View {
    
    @State var currentUserID: String? = nil
    
    @State var displayText: String? = nil
    
    @State var isLoading: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Here is safe coding")
                
                if let safeDisplayText = displayText {
                    Text(safeDisplayText)
                        .font(.title)
                }
                
                // Do not use ! ever!!!
                // Do not force unwrap values
                //Text(displayText!).font(.title)
                
                if isLoading {
                    ProgressView()
                }
                
                Spacer()
            }
            .navigationTitle("Safe Coding")
            .onAppear(perform: {
                loadData()
            })
        }
    }
    
    func loadData() {
        if let safeCurrentUserID = currentUserID {
            isLoading = true
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                displayText = "New data...userID is \(safeCurrentUserID)"
                isLoading = false
            }
        } else {
            displayText = "No user login..."
        }
    }
    
    func loadData2() {
        guard let safeCurrentUserID = currentUserID else {
            displayText = "No user login..."
            return
        }
        
        isLoading = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            displayText = "New data...userID is \(safeCurrentUserID)"
            isLoading = false
        }
    }
}

#Preview {
    IfLetGuardBootcamp()
}
