//
//  MultipleSheetBootcamp.swift
//  Bootcamp-SwiftUI
//
//  Created by loren on 2023/12/19.
//

import SwiftUI

// 1 - use Binding
// 2 - use multiple .sheet
// 3 - use $item

struct MultipleSheetBootcamp: View {
    
    @State var selectedModel: RandomModel?
    
    @State var showSheet: Bool = false
    
    @State var showSheet2: Bool = false
    
    var body: some View {
        VStack(spacing: 20.0) {
            Button("Button 1") {
                //showSheet.toggle()
                selectedModel = RandomModel(title: "One")
            }
//            .sheet(isPresented: $showSheet, content: {
//                RandomScreen(randomModel: RandomModel(title: "One"))
//            })
            
            Button("Button 2") {
                //showSheet2.toggle()
                selectedModel = RandomModel(title: "Two")
            }
//            .sheet(isPresented: $showSheet2, content: {
//                RandomScreen(randomModel: RandomModel(title: "Two"))
//            })
        }
        .sheet(item: $selectedModel) { model in
            RandomScreen(randomModel: model)
        }
        
    }
}

struct RandomModel: Identifiable {
    
    let id: String = UUID().uuidString
    
    let title: String
}

struct RandomScreen: View {
    
    let randomModel: RandomModel
    
    var body: some View {
        Text(randomModel.title)
            .font(.largeTitle)
    }
}

#Preview {
    MultipleSheetBootcamp()
}
