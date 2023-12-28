//
//  EscapingBootcamp.swift
//  Bootcamp-SwiftUI
//
//  Created by lorenliang on 2023/12/22.
//

import SwiftUI

struct EscapingBootcamp: View {
    
    @StateObject var vm = EscapingViewModel()
    
    var body: some View {
        Text(vm.text)
            .font(.title)
            .fontWeight(.semibold)
            .foregroundStyle(.blue)
            .onTapGesture {
                vm.getData()
            }
    }
}

class EscapingViewModel: ObservableObject {
    
    @Published var text: String = "Hello"
    
    func getData() {
        //let newData = downloadData()
        //text = newData
        
        downloadData4 { [weak self] returnData in
            self?.text = returnData.data
        }
    }
    
    func downloadData() -> String {
        return "New Data 1"
    }
    
    func downloadData2(handler: (_ data: String) -> ()) {
        handler("New Data 2")
    }
    
    func downloadData3(handler: @escaping (_ data: String) -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            handler("New Data 3")
        }
    }
    
    func downloadData4(handler: @escaping (DownloadedResult) -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            let result = DownloadedResult(data: "New Data 4")
            handler(result)
        }
    }
    
    // how to code?
    func downloadData5(handler: @escaping DownloadCompletion) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            let result = DownloadedResult(data: "New Data 4")
            handler(result)
        }
    }
    
}

struct DownloadedResult {
    let data: String
}

typealias DownloadCompletion = (DownloadedResult) -> ()

#Preview {
    EscapingBootcamp()
}
