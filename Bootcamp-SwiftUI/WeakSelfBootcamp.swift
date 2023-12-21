//
//  WeakSelfBootcamp.swift
//  Bootcamp-SwiftUI
//
//  Created by loren on 2023/12/21.
//

import SwiftUI

struct WeakSelfBootcamp: View {
    
    @AppStorage("count")
    var count: Int?
    
    init() {
        count = 0
    }
    
    var body: some View {
        NavigationView {
            NavigationLink("Navigate") {
                WeakSelfSecondSreen()
            }
            .navigationTitle("First View")
        }
        .overlay(alignment: .topTrailing) {
            Text("\(count ?? 0)")
                .font(.largeTitle)
                .padding()
                .background(.green)
                .clipShape(RoundedRectangle(cornerRadius: 10.0))
        }
    }
}

struct WeakSelfSecondSreen: View {
    
    @StateObject
    var vm = WeakSelfSecondSreenViewModel()
    
    var body: some View {
        VStack {
            Text("Second View")
                .font(.largeTitle)
                .foregroundStyle(.red)
            
            if let data = vm.data {
                Text(data)
                    .font(.headline)
                    .foregroundStyle(.green)
            }
        }
    }
}

class WeakSelfSecondSreenViewModel: ObservableObject {
    
    @Published
    var data: String? = nil
    
    init() {
        print("Init now...")
        
        let count = UserDefaults.standard.integer(forKey: "count")
        UserDefaults.standard.setValue(count + 1, forKey: "count")
        
        getData()
    }
    
    deinit {
        print("Deinit now...")
        
        let count = UserDefaults.standard.integer(forKey: "count")
        UserDefaults.standard.setValue(count - 1, forKey: "count")
    }
    
    func getData() {
        // self - strong reference
//        DispatchQueue.main.asyncAfter(deadline: .now() + 500) {
//            self.data = "New Data"
//        }
        
        // weak self - weak reference
        DispatchQueue.main.asyncAfter(deadline: .now() + 500) { [weak self] in
            self?.data = "New Data"
        }
    }
    
    
    
}

#Preview {
    WeakSelfBootcamp()
}
