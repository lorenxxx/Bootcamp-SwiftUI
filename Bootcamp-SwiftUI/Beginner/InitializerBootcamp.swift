//
//  InitializerBootcamp.swift
//  Bootcamp-SwiftUI
//
//  Created by loren on 2023/12/9.
//

import SwiftUI

struct InitializerBootcamp: View {
    
    let backgroundColor: Color
    
    let count: Int
    
    let title: String
    
    init(backgroundColor: Color, count: Int, title: String) {
        self.backgroundColor = backgroundColor
        self.count = count
        self.title = title
    }
    
    init(fruit: Fruit, count: Int) {
        if fruit == .apple {
            self.backgroundColor = Color.red
            self.title = "Apples"
        } else if fruit == .orange {
            self.backgroundColor = Color.orange
            self.title = "Oranges"
        } else {
            self.backgroundColor = Color.gray
            self.title = "Unknow"
        }
        
        self.count = count
    }
    
    enum Fruit {
        case apple
        case orange
    }
    
    var body: some View {
        VStack {
            Text("\(count)")
                .font(.largeTitle)
                .foregroundStyle(Color.white)
                .underline()
            
            Text(title)
                .font(.headline)
                .foregroundStyle(Color.white)
        }
        .frame(width: 150, height: 150)
        .background(backgroundColor)
        .cornerRadius(10.0)
    }
}

#Preview {
    HStack {
        InitializerBootcamp(fruit: .apple, count: 10)
        InitializerBootcamp(fruit: .orange, count: 99)
    }
    
}
