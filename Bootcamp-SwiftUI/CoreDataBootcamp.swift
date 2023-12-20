//
//  CoreDataBootcamp.swift
//  Bootcamp-SwiftUI
//
//  Created by loren on 2023/12/20.
//

import SwiftUI
import CoreData

struct CoreDataBootcamp: View {
    
    @StateObject
    private var vm = CoreDataViewModel()
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

class CoreDataViewModel: ObservableObject {
    
    let container: NSPersistentContainer
    
    @Published
    var savedFruits: [Fruit] = []
    
    init() {
        container = NSPersistentContainer(name: "FruitContainer")
        container.loadPersistentStores { description, error in
            if let err = error {
                print("ERROR LOADING CORE DATA. \(err)")
            } else {
                print("Successfully loaded core data.")
            }
        }
    }
    
}

#Preview {
    CoreDataBootcamp()
}
