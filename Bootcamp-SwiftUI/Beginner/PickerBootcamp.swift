//
//  PickerBootcamp.swift
//  Bootcamp-SwiftUI
//
//  Created by loren on 2023/12/11.
//

import SwiftUI

struct PickerBootcamp: View {
    
    //@State var selection: String = "1"
    
    @State var selection: String = "Most Recent"
    
    let filterOptions: [String] = [
        "Most Recent", "Most Popular", "Most Like"
    ]
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = .red
        
        let attributes: [NSAttributedString.Key:Any] = [
            .foregroundColor : UIColor.white
        ]
        UISegmentedControl.appearance().setTitleTextAttributes(attributes, for: .selected)
    }
    
    var body: some View {
        
//        VStack {
//            HStack {
//                Text("Age: ")
//                Text(selection)
//            }
//            
//            Picker("Age Picker", selection: $selection) {
//                ForEach(18..<100) { number in
//                    Text("\(number)")
//                        .font(.headline)
//                        .foregroundStyle(.red)
//                        .tag("\(number)")
//                }
//            }
//            .pickerStyle(.wheel)
//        }
        
//        Picker(selection: $selection) {
//            ForEach(filterOptions, id: \.self) { item in
//                HStack {
//                    Text(item)
//                    Image(systemName: "heart.fill")
//                }
//                .tag(item)
//            }
//        } label: {
//            HStack {
//                Text("Filter")
//                Text(selection)
//            }
//            .font(.headline)
//            .foregroundStyle(.white)
//            .padding()
//            .padding(.horizontal)
//            .cornerRadius(10.0)
//            .shadow(color: .blue.opacity(0.3), radius: 10, x: 0.0, y: 10.0)
//        }
//        .pickerStyle(.menu)
        
        
        Picker(selection: $selection) {
            ForEach(filterOptions, id: \.self) { item in
                HStack {
                    Text(item)
                }
                .tag(item)
            }
        } label: {
            HStack {
                Text("Filter")
                Text(selection)
            }
            .font(.headline)
            .foregroundStyle(.white)
            .padding()
            .padding(.horizontal)
            .cornerRadius(10.0)
            .shadow(color: .blue.opacity(0.3), radius: 10, x: 0.0, y: 10.0)
        }
        .pickerStyle(.segmented)
        .padding()
    }
}

#Preview {
    PickerBootcamp()
}
