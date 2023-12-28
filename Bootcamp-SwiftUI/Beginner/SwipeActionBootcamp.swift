//
//  SwipeActionBootcamp.swift
//  Bootcamp-SwiftUI
//
//  Created by lorenliang on 2023/12/14.
//

import SwiftUI

struct SwipeActionBootcamp: View {
    
    @State var fruits: [String] = [
        "apple", "orange", "banana", "peach"
    ]
    
    var body: some View {
        List {
            ForEach(fruits, id: \.self) { fruit in
                Text(fruit.capitalized)
            }
            //.onDelete(perform: delete)
            .swipeActions(edge: .leading , allowsFullSwipe: true) {
                Button("Share") {
                    
                }
                .tint(.pink)
            }
            .swipeActions(edge: .trailing , allowsFullSwipe: false) {
                Button("Archive") {
                    
                }
                .tint(.green)
                Button("Save") {
                    
                }
                .tint(.blue)
                Button("Junk") {
                    
                }
                .tint(.red)
            }
        }
    }
    
    func delete(indexSet: IndexSet) {
        fruits.remove(atOffsets: indexSet)
    }
}

#Preview {
    SwipeActionBootcamp()
}
