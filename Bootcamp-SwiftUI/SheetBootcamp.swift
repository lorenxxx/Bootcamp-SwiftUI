//
//  SheetBootcamp.swift
//  Bootcamp-SwiftUI
//
//  Created by loren on 2023/12/10.
//

import SwiftUI

struct SheetBootcamp: View {
    
    @State var showSheet: Bool = false
    
    var body: some View {
        ZStack {
            Color.green.ignoresSafeArea()
            
            Button(action: {
                showSheet.toggle()
            }, label: {
                Text("Button")
                    .foregroundStyle(.green)
                    .font(.headline)
                    .padding(20)
                    .background(.white)
                    .cornerRadius(10.0)
            })
//            .fullScreenCover(isPresented: $showSheet, content: {
//                SecondSreen()
//            })
            .sheet(isPresented: $showSheet, content: {
                // Do not add any conditional logic at here !!!
                SecondSreen()
            })
        }
    }
}

struct SecondSreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.red.ignoresSafeArea()
            
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "xmark")
                    .foregroundStyle(.white)
                    .font(.largeTitle)
                    .padding(20)
                    .cornerRadius(10.0)
            })
        }
    }
    
}

#Preview {
    SheetBootcamp()
    //SecondSreen()
}
