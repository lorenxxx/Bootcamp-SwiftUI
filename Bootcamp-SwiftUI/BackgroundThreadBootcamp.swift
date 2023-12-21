//
//  BackgroundThreadBootcamp.swift
//  Bootcamp-SwiftUI
//
//  Created by loren on 2023/12/21.
//

import SwiftUI

struct BackgroundThreadBootcamp: View {
    
    @StateObject
    var vm = BackgroundThreadViewModel()
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 10) {
                Text("Load Data")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .onTapGesture {
                        vm.fetchData()
                    }
                
                ForEach(vm.dataArray, id: \.self) { item in
                    Text(item)
                        .font(.headline)
                        .foregroundStyle(.red)
                }
            }
        }
    }
}

class BackgroundThreadViewModel: ObservableObject {
 
    @Published
    var dataArray: [String] = []
    
    func fetchData() {
        
        //DispatchQueue.global().async {
        DispatchQueue.global(qos: .background).async {
            let newData = self.downloadData()
            
            print("Check 1: \(Thread.isMainThread)")
            print("Check 1: \(Thread.current)")
            
            // Publishing changes from background threads is not allowed; make sure to publish values from the main thread (via operators like receive(on:)) on model updates.
            // self.dataArray = newData
            
            // go back to main thread to update UI
            DispatchQueue.main.async {
                print("Check 2: \(Thread.isMainThread)")
                print("Check 2: \(Thread.current)")
                
                self.dataArray = newData
            }
        }
        
    }
    
    private func downloadData() -> [String] {
        var data: [String] = []
        
        for x in 0..<100 {
            data.append("\(x)")
            print(data)
        }
        
        return data
    }
    
}

#Preview {
    BackgroundThreadBootcamp()
}
