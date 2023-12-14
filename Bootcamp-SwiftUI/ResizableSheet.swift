//
//  ResizableSheet.swift
//  Bootcamp-SwiftUI
//
//  Created by lorenliang on 2023/12/14.
//

import SwiftUI

struct ResizableSheet: View {
    
    @State private var showSheet: Bool = false
    
    var body: some View {
        Button("Click Me") {
            showSheet.toggle()
        }
        .sheet(isPresented: $showSheet, content: {
            MySheetView()
                //.presentationDetents([.medium])
                .presentationDetents([.medium, .large])
                //.presentationDetents([.fraction(0.33)])
                //.presentationDragIndicator(.hidden)
                //.interactiveDismissDisabled()
        })
//        .onAppear(perform: {
//            showSheet = true
//        })
    }
}

struct MySheetView: View {
    var body: some View {
        ZStack {
            Color.pink.ignoresSafeArea()
            
            Text("Welcome")
        }
    }
}

#Preview {
    ResizableSheet()
}
