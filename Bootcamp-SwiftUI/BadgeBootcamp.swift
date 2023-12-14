//
//  BadgeBootcamp.swift
//  Bootcamp-SwiftUI
//
//  Created by lorenliang on 2023/12/14.
//

import SwiftUI

// List
// TabView
struct BadgeBootcamp: View {
    var body: some View {
        TabView {
            Color.pink
                .ignoresSafeArea(edges: .top)
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("Hello")
                }
                .badge("New")
            
            Color.green
                .ignoresSafeArea(edges: .top)
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("Hello")
                }
                .badge(3)
            
            Color.yellow
                .ignoresSafeArea(edges: .top)
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("Hello")
                }
            
        }
        
        List {
            Text("Hello World")
            Text("Hello World")
            Text("Hello World")
            Text("Hello World")
                .badge(/*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
        }
    }
}

#Preview {
    BadgeBootcamp()
}
