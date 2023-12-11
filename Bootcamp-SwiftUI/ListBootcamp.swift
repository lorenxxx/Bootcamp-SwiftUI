//
//  ListBootcamp.swift
//  Bootcamp-SwiftUI
//
//  Created by lorenliang on 2023/12/11.
//

import SwiftUI

struct ListBootcamp: View {
    
    @State var fruits: [String] = [
        "apple", "orange", "banana", "peach"
    ]
    
    @State var veggies: [String] = [
        "tomato", "potato", "carrot"
    ]
    
    var body: some View {
        NavigationView {
            List {
                Section(
                    header: 
                        HStack {
                            Text("Fruits")
                            Image(systemName: "flame.fill")
                        }
                        //.font(.headline)
                        .foregroundStyle(.orange)
                ) {
                    ForEach(fruits, id: \.self) { item in
                        Text(item.capitalized)
                    }
                    .onDelete(perform: delete)
                    .onMove(perform: move)
                    //.listRowBackground(Color.pink)
                }
                
                Section(
                    header: 
                        Text("Veggies")
                            .foregroundStyle(.purple)
                ) {
                    ForEach(veggies, id: \.self) { item in
                        Text(item.capitalized)
                        
                    }
                }
            }
            //.listStyle(SidebarListStyle())
            .navigationTitle("Grocery List")
            .navigationBarItems(
                leading: EditButton(),
                trailing: addButton
            )
        }
        .accentColor(.red)
    }
    
    var addButton: some View {
        Button("Add", action: {
            add()
        })
    }
    
    func delete(indexSet: IndexSet) {
        fruits.remove(atOffsets: indexSet)
    }
    
    func move(fromOffsets: IndexSet, toOffset: Int) {
        fruits.move(fromOffsets: fromOffsets, toOffset: toOffset)
    }
    
    func add() {
        fruits.append("Coconut")
    }
}

#Preview {
    ListBootcamp()
}
