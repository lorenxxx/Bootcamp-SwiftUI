//
//  NavigationStackBootcamp.swift
//  Bootcamp-SwiftUI
//
//  Created by lorenliang on 2023/12/14.
//

import SwiftUI

struct NavigationStackBootcamp: View {
    
    let fruits = ["Apple", "Pear", "Banana"]
    
    @State private var stackPath: [String] = []
    
    var body: some View {
        //NavigationStack {
        NavigationStack(path: $stackPath) {
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(0..<10) { number in
                        NavigationLink(value: number) {
                            Text("Click Me - \(number)")
                        }
                    }
                    
                    ForEach(fruits, id: \.self) { fruit in
                        NavigationLink(value: fruit) {
                            Text(fruit)
                        }
                    }
                    
                    Button("Super Segue") {
                        //stackPath.append("Super Orange")
                        stackPath.append(contentsOf: ["Super Orange", "Super Coconut"])
                    }
                }
                .navigationTitle("Title")
                .navigationDestination(for: Int.self) { value in
                    SomeSecondSreen(number: value)
                }
                .navigationDestination(for: String.self) { value in
                    Text("Another Screen: \(value)")
                }
            }
        }
    }
}

struct SomeSecondSreen: View {
    
    let number: Int
    
    init(number: Int) {
        self.number = number
        print("Screen - \(number) init")
    }
    
    var body: some View {
        Text("Screen - \(number)")
    }
}

#Preview {
    NavigationStackBootcamp()
}
