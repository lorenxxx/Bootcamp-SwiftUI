//
//  GeometryReaderBootcamp.swift
//  Bootcamp-SwiftUI
//
//  Created by lorenliang on 2023/12/19.
//

import SwiftUI

struct GeometryReaderBootcamp: View {
    var body: some View {
//        GeometryReader(content: { geometry in
//            HStack(spacing: 0) {
//                Rectangle()
//                    .fill(.red)
//                    //.frame(width: UIScreen.main.bounds.width * 0.666)
//                    .frame(width: geometry.size.width * 0.666)
//                
//                Rectangle()
//                    .fill(.blue)
//            }
//            .ignoresSafeArea()
//        })
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(0..<30) { index in
                    GeometryReader(content: { geometry in
                        RoundedRectangle(cornerRadius: 10.0)
                            .rotation3DEffect(
                                Angle(degrees: getPercentage(geo: geometry) * 40),
                                //Angle(degrees: 40),
                                axis: (x: 0.0, y: 1.0, z: 0.0)
                            )
                    })
                    .frame(width: 300, height: 250)
                    .padding()
                }
            }
        }
    }
    
    func getPercentage(geo: GeometryProxy) -> Double {
        let maxDistance = UIScreen.main.bounds.width / 2
        let currentX = geo.frame(in: .global).midX
        
        return Double(1 - (currentX / maxDistance))
    }
}

#Preview {
    GeometryReaderBootcamp()
}
