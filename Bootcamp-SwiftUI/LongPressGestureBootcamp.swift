//
//  LongPressGestureBootcamp.swift
//  Bootcamp-SwiftUI
//
//  Created by loren on 2023/12/18.
//

import SwiftUI

struct LongPressGestureBootcamp: View {
    
    @State var isComplete: Bool = false
    
    @State var isSuccess: Bool = false
    
    var body: some View {
        //        Text(isComplete ? "Complete" : "Not Complete")
        //            .padding()
        //            .padding(.horizontal, 10)
        //            .background(isComplete ? .green : .gray)
        //            .clipShape(RoundedRectangle(cornerRadius: 10))
        //            .onLongPressGesture(minimumDuration: 2.0, maximumDistance: 100.0) {
        //                isComplete.toggle()
        //            }
        
        VStack {
            Rectangle()
                .fill(isSuccess ? .blue : .green)
                .frame(width: isComplete ? .infinity : 60, height: 60)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.gray)
            
            HStack {
                Text("Click Here")
                    .foregroundStyle(.white)
                    .padding()
                    .background(.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .onLongPressGesture(
                        minimumDuration: 2.0,
                        maximumDistance: 50.0,
                        perform: {
                            // at the min duration
                            withAnimation(.easeInOut) {
                                isSuccess = true
                            }
                        },
                        onPressingChanged: { isPressingChanged in
                            // start of press -> true
                            // before min duration -> false
                            if isPressingChanged {
                                withAnimation(.easeInOut(duration: 2.0)) {
                                    isComplete = true
                                }
                            } else {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                    if !isSuccess {
                                        withAnimation(.easeInOut) {
                                            isComplete = false
                                        }
                                    }
                                }
                            }
                        }
                    )

                Text("Reset")
                    .foregroundStyle(.white)
                    .padding()
                    .background(.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .onTapGesture {
                        isComplete = false
                        isSuccess = false
                    }
            }
        }
        
        
        
    }
}

#Preview {
    LongPressGestureBootcamp()
}
