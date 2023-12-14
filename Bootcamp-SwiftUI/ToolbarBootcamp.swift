//
//  ToolbarBootcamp.swift
//  Bootcamp-SwiftUI
//
//  Created by lorenliang on 2023/12/14.
//

import SwiftUI

struct ToolbarBootcamp: View {
    
    @State private var paths: [String] = []
    
    var body: some View {
        NavigationStack(path: $paths) {
            ZStack {
                Color.white
                    .ignoresSafeArea()
                
                ScrollView {
                    ForEach(0..<20) { _ in
                        RoundedRectangle(cornerRadius: 10.0)
                            .fill(.blue)
                            .frame(width: 200, height: 100)
                    }
                }
                .scrollIndicators(.hidden)
            }
            .navigationTitle("Twitter")
            //.navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Image(systemName: "heart.fill")
                }
                ToolbarItem(placement: .topBarTrailing) {
                    HStack {
                        //Image(systemName: "house.fill")
                        Image(systemName: "gear")
                    }
                }
            }
            //.toolbar(.hidden, for: .navigationBar)
            //.toolbarBackground(.hidden, for: .navigationBar)
            //.toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarTitleMenu {
                Button(action: {
                    paths.append("For You")
                }, label: {
                    HStack {
                        Text("For You")
                        Image(systemName: "heart.fill")
                    }
                })
                
                Button(action: {
                    paths.append("Follows")
                }, label: {
                    HStack {
                        Text("Follows")
                        Image(systemName: "person.fill")
                    }
                })
            }
            .navigationDestination(for: String.self) { value in
                Text("New Screen - \(value)")
            }
        }
    }
}

#Preview {
    ToolbarBootcamp()
}
