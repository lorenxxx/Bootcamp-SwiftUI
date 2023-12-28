//
//  TimerBootcamp.swift
//  Bootcamp-SwiftUI
//
//  Created by loren on 2023/12/23.
//

import SwiftUI

struct TimerBootcamp: View {
    
    let timer = Timer.publish(every: 2.0, on: .main, in: .common).autoconnect()
    
    // current time
    /*
    @State var currentDate: Date = .now
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        return formatter
    }
     */
    
    // countdown
    /*
    @State var count: Int = 10
    
    @State var finishText: String? = nil
     */
    
    // Animaton counter
    @State var count: Int = 0
    
    var body: some View {
        ZStack {
            RadialGradient(
                colors: [.white, .black],
                center: .center,
                startRadius: 100.0,
                endRadius: 600.0
            )
            .ignoresSafeArea()
            
            //Text(dateFormatter.string(from: currentDate))
//            Text(finishText ?? "\(count)")
//                .font(.system(size: 100.0, weight: .semibold, design: .rounded))
//                .foregroundStyle(.white)
//                .lineLimit(1)
//                .minimumScaleFactor(0.1)
//                .padding()
            
//            HStack(spacing: 15) {
//                Circle()
//                    .offset(y: count == 1 ? -15 : 0)
//                Circle()
//                    .offset(y: count == 2 ? -15 : 0)
//                Circle()
//                    .offset(y: count == 3 ? -15 : 0)
//            }
//            .foregroundStyle(.white)
//            .frame(width: 150)
            
            TabView(
                selection: $count,
                content: {
                    Rectangle().foregroundStyle(.red).tag(1)
                    Rectangle().foregroundStyle(.green).tag(2)
                    Rectangle().foregroundStyle(.pink).tag(3)
                    Rectangle().foregroundStyle(.purple).tag(4)
                    Rectangle().foregroundStyle(.brown).tag(5)
                }
            )
            .frame(height: 200)
            .tabViewStyle(.page)
        }
//        .onReceive(timer, perform: { value in
//            currentDate = value
//        })
//        .onReceive(timer, perform: { _ in
//            if count < 1 {
//                finishText = "Wow!"
//            } else {
//                count -= 1
//            }
//        })
//        .onReceive(timer, perform: { _ in
//            withAnimation(.easeInOut(duration: 0.5)) {
//                count = count == 3 ? 0 : count + 1
//            }
//        })
        .onReceive(timer, perform: { _ in
            withAnimation(.default) {
                count = count == 5 ? 0 : count + 1
            }
        })
    }
}

#Preview {
    TimerBootcamp()
}
