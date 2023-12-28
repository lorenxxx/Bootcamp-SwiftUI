//
//  CodableBootcamp.swift
//  Bootcamp-SwiftUI
//
//  Created by loren on 2023/12/22.
//

import SwiftUI

struct CodableBootcamp: View {
    
    @State var vm = CodableViewModel()
    
    var body: some View {
        VStack(spacing: 20.0) {
            if let customer = vm.customer {
                Text(customer.id)
                Text(customer.name)
                Text("\(customer.points)")
                Text(customer.isPremium.description)
            }
        }
    }
}

class CodableViewModel: ObservableObject {
    
    @Published var customer: CustomerModel? = nil
    
    init() {
        getData()
    }
    
    func getData() {
        guard let data = getJSONData() else { return }
        
//        print("JSON Data: ")
//        print(data)
        
        let jsonString = String(data: data, encoding: .utf8)
        print(jsonString)
        
//        if
//            let localData = try? JSONSerialization.jsonObject(with: data),
//            let dictionary = localData as? [String:Any],
//            let id = dictionary["id"] as? String,
//            let name = dictionary["name"] as? String,
//            let points = dictionary["points"] as? Int,
//            let isPremium = dictionary["isPremium"] as? Bool {
//            
//            let customer = CustomerModel(id: id, name: name, points: points, isPremium: isPremium)
//            self.customer = customer
//        }
        
//        do {
//            self.customer = try JSONDecoder().decode(CustomerModel.self, from: data)
//        } catch let error {
//            print("Error decode. \(error)")
//        }
        
        
        self.customer = try? JSONDecoder().decode(CustomerModel.self, from: data)
    }
    
    func getJSONData() -> Data? {
        // fake data
//        let dictionary: [String:Any] = [
//            "id": "1001",
//            "name": "Loren",
//            "points": 9,
//            "is_premium": true
//        ]
        
        // simulation
//        let jsonData = try? JSONSerialization.data(withJSONObject: customer)
        
        let customer = CustomerModel(
            id: "999",
            name: "Nick",
            points: 8,
            isPremium: true
        )
        
        let jsonData = try? JSONEncoder().encode(customer)
        
        return jsonData
    }
    
}

struct CustomerModel: Identifiable, Codable {
    
    let id: String
    let name: String
    let points: Int
    let isPremium: Bool

    // Codable can do all this thing automatically for you
//    enum CodingKeys: String, CodingKey {
//        case id
//        case name
//        case points
//        case isPremium = "is_premium"
//    }
//    
//    init(id: String, name: String, points: Int, isPremium: Bool) {
//        self.id = id
//        self.name = name
//        self.points = points
//        self.isPremium = isPremium
//    }
//    
//    // decode func
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        
//        self.id = try container.decode(String.self, forKey: .id)
//        self.name = try container.decode(String.self, forKey: .name)
//        self.points = try container.decode(Int.self, forKey: .points)
//        self.isPremium = try container.decode(Bool.self, forKey: .isPremium)
//    }
//    
//    // encode func
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        
//        try container.encode(id, forKey: .id)
//        try container.encode(name, forKey: .name)
//        try container.encode(points, forKey: .points)
//        try container.encode(isPremium, forKey: .isPremium)
//    }
    
}

#Preview {
    CodableBootcamp()
}
