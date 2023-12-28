//
//  ViewModelBootcamp.swift
//  Bootcamp-SwiftUI
//
//  Created by lorenliang on 2023/12/13.
//

import SwiftUI

struct FruitModel: Identifiable {
    let id: String = UUID().uuidString
    let name: String
    let count: Int
}

class FruitViewModel: ObservableObject {
    
    @Published var fruitArray: [FruitModel] = []
    
    @Published var isLoading: Bool = false
    
    init() {
        getFruits()
    }
    
    func getFruits() {
        let orange = FruitModel(name: "Orange", count: 7)
        let peach = FruitModel(name: "Peach", count: 3)
        let banana = FruitModel(name: "Banana", count: 5)
        
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.fruitArray.append(orange)
            self.fruitArray.append(peach)
            self.fruitArray.append(banana)
            
            self.isLoading = false
        }
    }
    
    func deleteFruits(indexSet: IndexSet) {
        fruitArray.remove(atOffsets: indexSet)
    }
    
}

struct ViewModelBootcamp: View {
    
    //@State var fruitArray: [FruitModel] = []
    
    // @ObservedObject - use this for subviews
    //@ObservedObject var fruitViewModel: FruitViewModel = FruitViewModel()
    
    // @StateObject - use this on creation / init
    @StateObject var fruitViewModel: FruitViewModel = FruitViewModel()
    
    var body: some View {
        NavigationView {
            List {
                if fruitViewModel.isLoading {
                    ProgressView()
                } else {
                    ForEach(fruitViewModel.fruitArray) { fruit in
                        HStack {
                            Text("\(fruit.count)")
                                .foregroundStyle(.red)
                            Text(fruit.name)
                                .font(.headline)
                                .bold()
                        }
                    }
                    .onDelete(perform: fruitViewModel.deleteFruits)
                }
            }
            .listStyle(.grouped)
            .navigationTitle("Fruits")
            .navigationBarItems(
                trailing: NavigationLink(
                    destination: {
                        AnotherScreen(fruitViewModel: fruitViewModel)
                    }, label: {
                        Image(systemName: "arrow.right")
                            .font(.headline)
                    })
            )
            //            .onAppear(perform: {
            //                fruitViewModel.getFruits()
            //            })
        }
    }
    
}

struct AnotherScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var fruitViewModel: FruitViewModel
    
    var body: some View {
        VStack {
            List {
                ForEach(fruitViewModel.fruitArray) { fruit in
                    HStack {
                        Text("\(fruit.count)")
                            .foregroundStyle(.green)
                        Text(fruit.name)
                            .font(.headline)
                            .bold()
                    }
                }
            }
            .listStyle(.grouped)
        }
    }
}

#Preview {
    ViewModelBootcamp()
}
