//
//  ViewBuilderBootcamp.swift
//  Bootcamp-SwiftUI
//
//  Created by lorenliang on 2024/1/3.
//

import SwiftUI

struct ViewBuilderBootcamp: View {
    var body: some View {
        VStack {
            RegularHeaderView(title: "R Title 1", description: "New Desc...", iconName: "heart.fill")
            
            RegularHeaderView(title: "R Title 2", description: nil, iconName: nil)
            
            //GenericHeaderView(title: "GenericTitle1", content: Text("Hello"))
            
            //GenericHeaderView(title: "GenericTitle1", content: Image(systemName: "heart.fill"))
            
            GenericHeaderView(title: "GTitle 1") {
                HStack {
                    Text("Hello")
                    Image(systemName: "heart.fill")
                }
            }
            
            CustomHStack {
                Text("Hi")
                Text("Hi")
            }
            
            HStack {
                Text("Hi")
                Text("Hi")
            }
            
            Spacer()
        }
        
    }
}

struct RegularHeaderView: View {
    
    let title: String
    
    let description: String?
    
    let iconName: String?
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            if let description = description {
                Text(description)
                    .font(.callout)
            }
            
            if let iconName = iconName {
                Image(systemName: iconName)
            }
            
            RoundedRectangle(cornerRadius: 15.0)
                .frame(height: 2)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct GenericHeaderView<Content:View>: View {
    
    let title: String
    
    let content: Content
    
    init(title: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            content
            
            RoundedRectangle(cornerRadius: 15.0)
                .frame(height: 2)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct CustomHStack<Content:View>: View {
    
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        HStack {
            content
        }
    }
}

#Preview {
    ViewBuilderBootcamp()
}
