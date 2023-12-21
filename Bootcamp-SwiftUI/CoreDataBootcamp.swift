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
    
    @State
    var textFieldText: String = ""
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                TextField("Add Fruit Here...", text: $textFieldText)
                    .padding(.leading)
                    .font(.headline)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(.gray.opacity(0.3))
                    .clipShape(RoundedRectangle(cornerRadius: 15.0))
                    .padding(.horizontal)
                    
                Button(action: {
                    guard !textFieldText.isEmpty else { return }
                    vm.addFruit(name: textFieldText)
                    
                    textFieldText = ""
                }, label: {
                    Text("Submit")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 15.0))
                        .padding(.horizontal)
                })
                    
                List {
                    ForEach(vm.savedFruits) { fruit in
                        Text(fruit.name ?? "No Name")
                            .onTapGesture {
                                vm.updateFruit(fruit: fruit)
                            }
                    }
                    .onDelete(perform: vm.deleteFruit)
                }
                .listStyle(.plain)
            }
            .navigationTitle("All Fruits")
        }
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
                print("Error load core data. \(err)")
            } else {
                print("Successfully loaded core data.")
            }
        }
        
        fetchFruits()
    }
    
    func fetchFruits() {
        let request = NSFetchRequest<Fruit>(entityName: "Fruit")
        
        do {
            savedFruits = try container.viewContext.fetch(request)
        } catch let error {
            print("Error fetch fruits. \(error)")
        }
    }
    
    func addFruit(name: String) {
        let fruit = Fruit(context: container.viewContext)
        fruit.name = name
        
        saveData()
    }
    
    func updateFruit(fruit: Fruit) {
        let currentName = fruit.name ?? ""
        let newName = currentName  + " ! "
        fruit.name = newName
        
        saveData()
    }
    
    func deleteFruit(indexSet: IndexSet) {
        guard let index = indexSet.first else { return }
        let fruit = savedFruits[index]
        
        container.viewContext.delete(fruit)
        
        saveData()
    }
    
    func saveData() {
        do {
            try container.viewContext.save()
            
            fetchFruits()
        } catch let error {
            print("Error save data. \(error)")
        }
    }
    
}

#Preview {
    CoreDataBootcamp()
}
