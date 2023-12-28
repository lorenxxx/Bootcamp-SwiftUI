//
//  OnAppearBootcamp.swift
//  Bootcamp-SwiftUI
//
//  Created by loren on 2023/12/12.
//

import SwiftUI

struct OnAppearBootcamp: View {
    
    @State var myText: String = "Starting text"
    
    @State var count: Int = 0
    
    var body: some View {
        NavigationView {
            ScrollView {
                Text(myText)
                LazyVStack {
                    ForEach(0..<50, id: \.self) { _ in
                        RoundedRectangle(cornerRadius: 25.0)
                            .frame(height: 200)
                            .padding()
                            .onAppear(perform: {
                                count += 1
                            })
                    }
                }
            }
            .onAppear(perform: {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    myText = "New text"
                }
            })
            .onDisappear(perform: {
                myText = "Ending text"
            })
            .navigationTitle("On Appear: \(count)")
        }
    }
}

#Preview {
    OnAppearBootcamp()
}
