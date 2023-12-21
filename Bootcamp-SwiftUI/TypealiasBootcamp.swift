//
//  TypealiasBootcamp.swift
//  Bootcamp-SwiftUI
//
//  Created by loren on 2023/12/21.
//

import SwiftUI

struct TypealiasBootcamp: View {
    
    //@State
    //var item: Movie = Movie(title: "Title", director: "Joe", count: 10)
    
    @State
    var item: TVShow = TVShow(title: "Title", director: "Joe", count: 10)
    
    var body: some View {
        VStack(spacing: 20) {
            Text(item.title)
            Text(item.director)
            Text("\(item.count)")
        }
    }
}

struct Movie {
    let title: String
    let director: String
    let count: Int
    
}

//struct TVShow {
//    let title: String
//    let director: String
//    let count: Int
//    
//}

typealias TVShow = Movie

#Preview {
    TypealiasBootcamp()
}
