//
//  PreferenceKeyBootcamp.swift
//  Bootcamp-SwiftUI
//
//  Created by lorenliang on 2024/1/3.
//

import SwiftUI

struct PreferenceKeyBootcamp: View {
    
    @State private var text: String = "Hello, world!"
    
    var body: some View {
        NavigationView {
            VStack {
                SecondaryScreen(text: text)
                    .navigationTitle("NaviTitle")
                    //.preference(key: CustomTitlePreferenceKey.self, value: "New Value")
                    .customTitle("New Value")
            }
        }
        .onPreferenceChange(CustomTitlePreferenceKey.self, perform: { value in
            self.text = value
        })
    }
}

struct SecondaryScreen: View {
    
    let text: String
    
    var body: some View {
        Text(text)
    }
}

struct CustomTitlePreferenceKey: PreferenceKey {
    
    static var defaultValue: String = ""
    
    static func reduce(value: inout String, nextValue: () -> String) {
        value = nextValue()
    }
    
}

extension View {
    
    func customTitle(_ text: String) -> some View {
        preference(key: CustomTitlePreferenceKey.self, value: text)
    }
    
}

#Preview {
    PreferenceKeyBootcamp()
}
