//
//  ContextMenuBootcamp.swift
//  Bootcamp-SwiftUI
//
//  Created by lorenliang on 2023/12/11.
//

import SwiftUI

struct ContextMenuBootcamp: View {
    
    @State var bgColor: Color = .pink
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10.0) {
            Image(systemName: "house.fill")
                .font(.title)
            Text("Switful Thinking")
                .font(.headline)
            Text("How to use ContextMenu")
                .font(.subheadline )
        }
        .foregroundStyle(Color.white)
        .padding()
        .background(bgColor.cornerRadius(25.0))
        .contextMenu(ContextMenu(menuItems: {
            Button(action: {
                bgColor = .yellow
            }, label: {
                Label(
                    title: { Text("Share post") },
                    icon: { Image(systemName: "flame.fill") }
                )
            })
            
            Button(action: {
                bgColor = .red
            }, label: {
                Text("Report post")
            })
            
            Button(action: {
                bgColor = .green
            }, label: {
                HStack {
                    Text("Like post")
                    Image(systemName: "heart.fill")
                }
            })
            
        }))
        
    }
}

#Preview {
    ContextMenuBootcamp()
}
