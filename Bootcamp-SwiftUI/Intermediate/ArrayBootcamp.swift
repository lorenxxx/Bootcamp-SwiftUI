//
//  ArrayBootcamp.swift
//  Bootcamp-SwiftUI
//
//  Created by lorenliang on 2023/12/20.
//

import SwiftUI

struct ArrayBootcamp: View {
    
    @StateObject var vm = PersionViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
//                ForEach(vm.filterArray) { person in
//                    VStack(alignment: .leading) {
//                        Text(person.name)
//                            .font(.headline)
//                        HStack {
//                            Text("Points: \(person.point)")
//                            Spacer()
//                            if person.isVerified {
//                                Image(systemName: "flame.fill")
//                            }
//                        }
//                    }
//                    .foregroundStyle(.white)
//                    .padding()
//                    .background(.blue)
//                    .cornerRadius(10.0)
//                    .padding(.horizontal)
//                }
                
                ForEach(vm.mappedArray, id: \.self) { item in
                    Text(item)
                        .font(.headline)
                }
            }
        }
    }
}

struct PersonModel: Identifiable {
    let id = UUID().uuidString
    let name: String
    let point: Int
    let isVerified: Bool
}

class PersionViewModel: ObservableObject {
    
    @Published var dataArray: [PersonModel] = []
    
    @Published var filterArray: [PersonModel] = []
    
    @Published var mappedArray: [String] = []
    
    init() {
        getPersons()
        updateFilterArray()
    }
    
    func getPersons() {
        let p1 = PersonModel(name: "Loren", point: 5, isVerified: true)
        let p2 = PersonModel(name: "Jack", point: 4, isVerified: true)
        let p3 = PersonModel(name: "Nick", point: 3, isVerified: false)
        let p4 = PersonModel(name: "Jeo", point: 2, isVerified: true)
        let p5 = PersonModel(name: "Sarah", point: 4, isVerified: false)
        let p6 = PersonModel(name: "Lisa", point: 1, isVerified: true)
        let p7 = PersonModel(name: "Chris", point: 5, isVerified: true)
        let p8 = PersonModel(name: "Emily", point: 5, isVerified: false)
        let p9 = PersonModel(name: "Jim", point: 3, isVerified: true)
        let p10 = PersonModel(name: "Pinkman", point: 3, isVerified: true)
        
        self.dataArray.append(contentsOf: [
            p1, p2, p3, p4, p5, p6, p7, p8, p9, p10
        ])
    }
    
    func updateFilterArray() {
        // sort
//        filterArray = dataArray.sorted { person1, person2 in
//            return person1.point > person2.point
//        }
        
        // filter
//        filterArray = dataArray.filter({ person in
//            return person.point >= 3
//        })
        
        mappedArray = dataArray.map({ person in
            return person.name
        })

    }
    
}

#Preview {
    ArrayBootcamp()
}
