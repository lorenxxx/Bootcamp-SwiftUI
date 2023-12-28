//
//  TabViewBootcamp.swift
//  Bootcamp-SwiftUI
//
//  Created by lorenliang on 2023/12/12.
//

import SwiftUI

struct TabViewBootcamp: View {
    
    @State var selectedTab: Int = 0
    
    let icons: [String] = [
        "heart.fill", "globe", "house.fill", "person.fill"
    ]
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView(selectedTab: $selectedTab)
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                .tag(0)
                
            BrowseView()
                .tabItem {
                    Image(systemName: "globe")
                    Text("Browse")
                }
                .tag(1)
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
                .tag(2)
        }
        .accentColor(.red)
        
        
//        TabView {
//            ForEach(icons, id: \.self) { icon in
//                Image(systemName: icon)
//                    .resizable()
//                    .scaledToFit()
//                    .padding(35)
//            }
//        }
//        .background(
//            RadialGradient(
//                colors: [.red, .blue],
//                center: .center,
//                startRadius: 5,
//                endRadius: 300
//            )
//        )
//        .tabViewStyle(.page)
//        .frame(height: 300)
    }
}

#Preview {
    TabViewBootcamp()
}

struct HomeView: View {
    
    @Binding var selectedTab: Int
    
    var body: some View {
        ZStack {
//            Color.pink
//                .ignoresSafeArea(edges: .top)
            
            VStack {
                Text("Home Tab")
                    .font(.title)
                    .foregroundStyle(.red)
                
                Button(action: {
                    selectedTab = 2
                }, label: {
                    Text("Go to profile")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .padding()
                        .padding(.horizontal)
                        .background(.red)
                        .cornerRadius(10.0)
                })
            }
        }
    }
    
}

struct BrowseView: View {
    var body: some View {
        Text("Browse Tab")
            .font(.title)
            .foregroundStyle(.red)
    }
}

struct ProfileView: View {
    var body: some View {
        Text("Profile Tab")
            .font(.title)
            .foregroundStyle(.red)
    }
}
