//
//  HashableBootcamp.swift
//  Bootcamp-SwiftUI
//
//  Created by lorenliang on 2023/12/20.
//

import SwiftUI

struct HashableBootcamp: View {
    
    let data: [String] = ["One", "Two", "Three", "Four", "Five"]
    
    let customData: [CustomModel] = [
        CustomModel(title: "Hi"),
        CustomModel(title: "Hello"),
        CustomModel(title: "Hola")
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 40) {
//                ForEach(data, id: \.self) { item in
//                    Text(item)
//                        .font(.headline)
//                }
                
//                ForEach(customData) { item in
//                    Text(item.title)
//                        .font(.headline)
//                }
                
                ForEach(customData, id: \.self) { item in
                    Text(item.hashValue.description)
                        .font(.headline)
                }
            }
        }
    }
}

struct CustomModel: Hashable {
    
    //let id: String = UUID().uuidString
    
    let title: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
    }
    
}

#Preview {
    HashableBootcamp()
}
