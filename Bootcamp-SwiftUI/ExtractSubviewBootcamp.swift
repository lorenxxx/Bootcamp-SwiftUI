//
//  ExtractSubviewBootcamp.swift
//  Bootcamp-SwiftUI
//
//  Created by loren on 2023/12/9.
//

import SwiftUI

struct ExtractSubviewBootcamp: View {
    var body: some View {
        ZStack {
            Color.orange
                .ignoresSafeArea()
            
            contentLayer
        }
    }
    
    var contentLayer: some View {
        HStack {
            MyItem(title: "Apples", count: 10)
            MyItem(title: "Oranges", count: 17)
        }
    }
}

#Preview {
    ExtractSubviewBootcamp()
}

struct MyItem: View {
    
    let title: String
    
    let count: Int
    
    var body: some View {
        VStack {
            Text("\(count)")
                .font(.title)
                .underline()
                .padding()
            
            Text(title)
                .font(.headline)
        }
        .padding()
        .padding(.horizontal, 10)
        .frame(width: 120)
        .background(Color.red)
        .cornerRadius(10.0)
    }
    
}
