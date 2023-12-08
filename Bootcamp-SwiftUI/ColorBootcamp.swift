//
//  ColorsBootcamp.swift
//  Bootcamp-SwiftUI
//
//  Created by loren on 2023/12/6.
//

import SwiftUI

struct ColorsBootcamp: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(
                //Color.primary
                //Color.secondary
                //Color(uiColor: .darkGray)
                Color("CustomColor")
                
                
            )
            .frame(width: 300, height: 200)
            //.shadow(radius: 10)
            .shadow(color: Color("CustomColor").opacity(0.3), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: -20, y: -20)
            
    }
}

#Preview {
    ColorsBootcamp()
}
