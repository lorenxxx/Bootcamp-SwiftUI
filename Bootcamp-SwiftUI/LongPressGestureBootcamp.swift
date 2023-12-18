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
                .fill(isSuccess ? .green : .blue)
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
                            withAnimation(.easeInOut) {
                                isSuccess.toggle()
                            }
                        },
                        onPressingChanged: { isPressingChanged in
                            if isPressingChanged {
                                withAnimation(.easeInOut(duration: 1.0)) {
                                    isComplete.toggle()
                                }
                            }
                            print(isPressingChanged.description)
                        }
                    )
                
//                    .onLongPressGesture(
//                        minimumDuration: 1.0,
//                        maximumDistance: 50.0,
//                        pressing: { isPressing in
//                            if isPressing {
//                                withAnimation(.easeInOut) {
//                                    isComplete.toggle()
//                                }
//                            }
//                        },
//                        perform: {
//                            withAnimation(.easeInOut(duration: 1.0)) {
//                                isSuccess.toggle()
//                            }
//                        }
//                    )
                        

                
                
                Text("Reset")
                    .foregroundStyle(.white)
                    .padding()
                    .background(.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
        }
        
        
        
    }
}

#Preview {
    LongPressGestureBootcamp()
}
