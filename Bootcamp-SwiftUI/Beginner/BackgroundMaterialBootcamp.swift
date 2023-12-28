//
//  BackgroundMaterialBootcamp.swift
//  Bootcamp-SwiftUI
//
//  Created by loren on 2023/12/14.
//

import SwiftUI

struct BackgroundMaterialBootcamp: View {
    var body: some View {
        VStack {
            Spacer()
            
            VStack {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 50, height: 5)
                    .padding()
                
                Spacer()
                
            }
            .frame(height: 350)
            .frame(maxWidth: .infinity)
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 30.0))
        }
        .ignoresSafeArea()
        .background(
            Image("lorenliang")
        )
    }
}

#Preview {
    BackgroundMaterialBootcamp()
}
