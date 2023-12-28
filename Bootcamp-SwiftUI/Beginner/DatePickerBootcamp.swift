//
//  DatePickerBootcamp.swift
//  Bootcamp-SwiftUI
//
//  Created by lorenliang on 2023/12/12.
//

import SwiftUI

struct DatePickerBootcamp: View {
    
    @State var selectedDate: Date = Date()
    
    let startingDate: Date = Calendar.current.date(from: DateComponents(year: 2020)) ?? Date()
    
    let endingDate: Date = Date()
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }
    
    var body: some View {
        HStack {
            Text("Selected Date: ")
            Text(dateFormatter.string(from: selectedDate))
        }
        .font(.headline)
        
//        DatePicker("Select a date", selection: $selectedDate)
//            .datePickerStyle(.wheel)
        
//        DatePicker(
//            "Select a date",
//            selection: $selectedDate,
//            displayedComponents: [.hourAndMinute]
//        )
//        .datePickerStyle(.wheel)
        
        DatePicker("Select a date", selection: $selectedDate, in: startingDate...endingDate)
            .datePickerStyle(.wheel)
    }
}

#Preview {
    DatePickerBootcamp()
}
