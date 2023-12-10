//
//  Transition.swift
//  Bootcamp-SwiftUI
//
//  Created by loren on 2023/12/10.
//

import SwiftUI

struct Transition: View {
    
    @State var showView: Bool = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                Button("Button") {
                    showView.toggle()
                }
                
                Spacer()
            }
            
            if showView {
                RoundedRectangle(cornerRadius: 25.0)
                    .frame(height: UIScreen.main.bounds.height * 0.5)
                    //.opacity(showView ? 1.0 : 0.0)
                    //.transition(.slide)
                    //.transition(/*@START_MENU_TOKEN@*/.identity/*@END_MENU_TOKEN@*/)
                    .transition(.move(edge: .bottom))
                    .animation(.spring())
            }
        }
        
        .ignoresSafeArea(edges: /*@START_MENU_TOKEN@*/.bottom/*@END_MENU_TOKEN@*/)
        
    }
}

#Preview {
    Transition()
}
