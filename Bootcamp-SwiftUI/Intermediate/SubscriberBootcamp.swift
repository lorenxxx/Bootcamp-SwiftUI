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
            
            Text(vm.textIsValid.description)
            
            TextField("Type someting here", text: $vm.textFieldText)
                .padding(.leading)
                .frame(height: 55.0)
                .background(.gray.opacity(0.3))
                .clipShape(RoundedRectangle(cornerRadius: 10.0))
                .overlay(alignment: .trailing) {
                    ZStack {
                        Image(systemName: "xmark")
                            .foregroundStyle(.red)
                            .opacity(
                                vm.textFieldText.count < 1 ? 0.0 :
                                vm.textIsValid ? 0.0 : 1.0)
                        
                        Image(systemName: "checkmark")
                            .foregroundStyle(.green)
                            .opacity(vm.textIsValid ? 1.0 : 0.0)
                    }
                    .font(.headline)
                    .padding(.trailing)
                }
            
            Button {
                
            } label: {
                Text("Submit")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 10.0))
                    .opacity(vm.showButton ? 1.0 : 0.5)
            }
            .disabled(!vm.showButton)

        }
        .padding()
    }
}

class SubscriberViewModel: ObservableObject {
    
    @Published var count: Int = 0
    
    //var timer: AnyCancellable?
    
    @Published var textFieldText: String = ""
    
    @Published var textIsValid: Bool = false
    
    @Published var showButton: Bool = false
    
    var cancellables = Set<AnyCancellable>()
    
    init() {
        setUpTimer()
        addTextFieldSubscriber()
        addButtonSubscriber()
    }
    
    func setUpTimer() {
        Timer
            .publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                guard let self = self else { return }
                self.count += 1
                
                //                if self.count >= 10 {
                //                    for item in self.cancellables {
                //                        item.cancel()
                //                    }
                //                }
            }
            .store(in: &cancellables)
    }
    
    func addTextFieldSubscriber() {
        $textFieldText
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map { text in
                if text.count > 3 {
                    return true
                }
                
                return false
            }
            //.assign(to: \.textIsValid, on: self)
            .sink(receiveValue: { [weak self] isValid in
                self?.textIsValid = isValid
            })
            .store(in: &cancellables)
    }
    
    func addButtonSubscriber() {
        $textIsValid
            .combineLatest($count)
            .sink { [weak self] isValid, count in
                guard let self = self else { return }
                
                if isValid && count >= 10 {
                    self.showButton = true
                } else {
                    self.showButton = false
                }
            }
            .store(in: &cancellables)
    }
    
}

#Preview {
    SubscriberBootcamp()
}
