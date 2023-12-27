//
//  MatchedGeometryEffectBootcamp.swift
//  Bootcamp-SwiftUI
//
//  Created by lorenliang on 2023/12/27.
//

import SwiftUI

struct MatchedGeometryEffectBootcamp: View {
    
    @State private var isClicked: Bool = false
    
    @Namespace private var namespace
    
    var body: some View {
        VStack {
            if !isClicked {
                RoundedRectangle(cornerRadius: 15.0)
                    .matchedGeometryEffect(id: "rectangle", in: namespace)
                    .frame(width: 100, height: 100)
            }
            
            Spacer()
            
            if isClicked {
                RoundedRectangle(cornerRadius: 15.0)
                    .matchedGeometryEffect(id: "rectangle", in: namespace)
                    .frame(width: 300, height: 200)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.red)
        .onTapGesture {
            withAnimation(.easeInOut) {
                isClicked.toggle()
            }
        }
    }
}

struct MatchedGeometryEffectExample: View {
    
    let categories: [String] = ["Home", "Popular", "Saved"]
    
    @State private var selected: String = ""
    
    @Namespace private var namespace
    
    var body: some View {
        HStack {
            ForEach(categories, id: \.self) { category in
                ZStack {
                    if selected == category {
                        RoundedRectangle(cornerRadius: 15.0)
                            .fill(.blue.opacity(0.8))
                            .matchedGeometryEffect(id: "catagoryBackground", in: namespace)
                            //.frame(width: 35, height: 2)
                            //.offset(y: 15)
                    }
                    
                    Text(category)
                }
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .onTapGesture {
                    withAnimation(.spring) {
                        selected = category
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    //MatchedGeometryEffectBootcamp()
    MatchedGeometryEffectExample()
}
