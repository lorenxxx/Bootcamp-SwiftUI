//
//  SubscriberBootcamp.swift
//  Bootcamp-SwiftUI
//
//  Created by loren on 2023/12/23.
//

import SwiftUI
import Combine


struct SubscriberBootcamp: View {
    
    @StateObject var vm = SubscriberViewModel()
    
    var body: some View {
        VStack {
            Text("\(vm.count)")
                .font(.largeTitle)
        }
    }
}

class SubscriberViewModel: ObservableObject {
    
    @Published var count: Int = 0
    
    var timer: AnyCancellable?
    
    init() {
        setUpTimer()
    }
    
    func setUpTimer() {
        timer = Timer.publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                self?.count += 1
                
                if let count = self?.count, count >= 10 {
                    self?.timer?.cancel()
                }
            }
    }
    
}

#Preview {
    SubscriberBootcamp()
}
