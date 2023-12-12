//
//  DocumentationBootcamp.swift
//  Bootcamp-SwiftUI
//
//  Created by lorenliang on 2023/12/12.
//

import SwiftUI

struct DocumentationBootcamp: View {
    
    // MARK: PROPERTIES
    
    @State var data: [String] = [
        "Apple", "Orange", "Peach"
    ]
    
    @State var showAlert: Bool = false
    
    // MARK: BODY
    
    // sinle-line comment ...
    
    /*
     multi-line comment ...
     */
    
    var body: some View {
        NavigationView { // START: NAV
            ZStack {
                // background
                Color.red
                    .ignoresSafeArea()
                
                // foreground
                foregroundLayer
                .navigationTitle("Documentation")
                .navigationBarItems(
                    trailing: Button("Alert", action: {
                        showAlert.toggle()
                    })
                )
                .alert(isPresented: $showAlert, content: {
                    getAlert(text: "This is a alert")
                })
            }
        }
    } // END: NAV
    
    // MARK: COSTOM VIEW
    
    /// This is the foreground layer that holds a scroll view.
    private var foregroundLayer: some View {
        ScrollView { // START: SCROLLV
            Text("Hello")
            ForEach(data, id: \.self) { fruit in
                Text(fruit)
                    .font(.headline)
            }
        } // END: SCROLLV
    }
    
    // MARK: FUNCTIONS
    
    ///  Gets an alert with for specified text.
    ///
    ///   This is discussion.
    ///
    ///   ```
    ///   getAlert(text: "Hi") -> Alert(title: Text("Hi"))
    ///   ```
    ///
    /// - Warning: warning goes here
    /// - Parameter text: This is the title for the alert.
    /// - Returns: Returns a alert with title.
    func getAlert(text: String) -> Alert {
        return Alert(title: Text(text))
    }
}

// MARK: PREVIEW

#Preview {
    DocumentationBootcamp()
}
