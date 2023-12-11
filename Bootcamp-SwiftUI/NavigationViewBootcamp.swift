//
//  NavigationViewBootcamp.swift
//  Bootcamp-SwiftUI
//
//  Created by lorenliang on 2023/12/11.
//

import SwiftUI

struct NavigationViewBootcamp: View {
    var body: some View {
        NavigationView {
            ScrollView {
                NavigationLink("Hi") {
                    MyOtherScreen()
                }
                
                
                Text("hello")
                Text("hello")
                Text("hello")
            }
            .navigationTitle("All Inboxes")
            //.navigationBarTitleDisplayMode(.automatic)
            //.navigationBarHidden(true)
            .navigationBarItems(
                leading: 
                    HStack {
                        Image(systemName: "person.fill")
                        Image(systemName: "flame.fill")
                    }
                ,
                trailing: NavigationLink(destination: {
                    MyOtherScreen()
                }, label: {
                    Image(systemName: "gear")
                })
                .accentColor(.red)
            )
        }
    }
}

struct MyOtherScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Color.pink
                .ignoresSafeArea()
                .navigationTitle("Pink Screen")
                .navigationBarHidden(true)
            
            VStack {
                Button("Back") {
                    presentationMode.wrappedValue.dismiss()
                }
                
                NavigationLink("Click Here") {
                    Text("third screen")
                }
            }
        }
    }
}

#Preview {
    NavigationViewBootcamp()
}
