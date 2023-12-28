//
//  NativePopoverBootcamp.swift
//  Bootcamp-SwiftUI
//
//  Created by loren on 2023/12/14.
//

import SwiftUI

struct NativePopoverBootcamp: View {
    
    @State private var showPopover: Bool = false
    
    @State private var feedbackOptions: [String] = ["Good", "Average", "Bad"]
    
    var body: some View {
        ZStack {
            Color.gray
                .ignoresSafeArea()
            
            Button("Click Me") {
                showPopover.toggle()
            }
//            .popover(isPresented: $showPopover, content: {
//                Text("Popover")
//                    .presentationCompactAdaptation(.popover)
//            })
//            .popover(isPresented: $showPopover, attachmentAnchor: .point(.top), arrowEdge: .top, content: {
//                Text("Popover")
//                    .padding()
//                    .presentationCompactAdaptation(.popover)
//            })
            .popover(isPresented: $showPopover, attachmentAnchor: .point(.trailing), content: {
                ScrollView {
                    VStack(alignment: .leading, spacing: 12, content: {
                        ForEach(feedbackOptions, id: \.self) { option in
                            Button(option) {
                                
                            }
                            
                            if option != feedbackOptions.last {
                                Divider()
                            }
                        }
                    })
                    .padding()
                }
                .presentationCompactAdaptation(.popover)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            })
        }
    }
}

#Preview {
    NativePopoverBootcamp()
}
