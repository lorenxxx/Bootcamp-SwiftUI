//
//  ScrollViewReaderBootcamp.swift
//  Bootcamp-SwiftUI
//
//  Created by lorenliang on 2023/12/19.
//

import SwiftUI

struct ScrollViewReaderBootcamp: View {
    
    @State var textFieldText: String = ""
    
    @State var scrollToIndex: Int = 0
    
    var body: some View {
        VStack {
            TextField("Go to Item #", text: $textFieldText)
                .padding(.leading)
                .frame(height: 55)
                .border(.gray)
                .padding(.horizontal)
                .keyboardType(.numberPad)
            
            Button("Scroll Now") {
                withAnimation(.spring) {
                    if let index = Int(textFieldText) {
                        scrollToIndex = index
                    }
                }
            }
            
            ScrollView {
                ScrollViewReader(content: { proxy in
                    ForEach(0..<50) { number in
                        Text("Item #\(number)")
                            .font(.headline)
                            .frame(height: 200)
                            .frame(maxWidth: .infinity)
                            .background(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10.0))
                            .shadow(radius: 10)
                            .padding()
                            .id(number)
                    }
                    .onChange(of: scrollToIndex, perform: { value in
                        withAnimation(.spring) {
                            proxy.scrollTo(value, anchor: .bottom)
                        }
                    })
                })
            }
        }
    }
}

#Preview {
    ScrollViewReaderBootcamp()
}
