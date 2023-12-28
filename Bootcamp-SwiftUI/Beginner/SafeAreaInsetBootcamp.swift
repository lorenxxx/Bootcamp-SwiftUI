//
//  SafeAreaInsetBootcamp.swift
//  Bootcamp-SwiftUI
//
//  Created by loren on 2023/12/14.
//

import SwiftUI

struct SafeAreaInsetBootcamp: View {
    var body: some View {
        NavigationStack {
            List {
                ForEach(0..<10) { _ in
                    RoundedRectangle(cornerRadius: 15.0)
                        .fill(Color.pink)
                        .frame(width: 300, height: 300)
                }
            }
            .navigationTitle("Safe Area Inset")
            .scrollIndicators(.hidden)
//            .overlay(alignment: .bottom, content: {
//                Text("Hi")
//                    .frame(maxWidth: .infinity)
//                    .background(.green)
//            })
            .safeAreaInset(edge: .bottom, alignment: .center, spacing: nil) {
                Text("Hi")
                    .padding()
                    .background(.green)
                    .clipShape(Circle())
                    .padding()
            }
        }
    }
}

#Preview {
    SafeAreaInsetBootcamp()
}
