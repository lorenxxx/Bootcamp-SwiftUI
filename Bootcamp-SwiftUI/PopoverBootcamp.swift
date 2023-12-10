//
//  PopoverBootcamp.swift
//  Bootcamp-SwiftUI
//
//  Created by loren on 2023/12/10.
//

import SwiftUI

struct PopoverBootcamp: View {
    
    @State var showNewScreen: Bool = false
    
    var body: some View {
        ZStack {
            Color.orange
                .ignoresSafeArea()
            
            VStack {
                Button("Button") {
                    showNewScreen.toggle()
                }
                .font(.largeTitle)
                
                Spacer()
            }
            // Method 1 - Sheet
//            .sheet(isPresented: $showNewScreen, content: {
//                NewScreen()
//            })
            
            // Method 2 - Transition
//            ZStack {
//                if showNewScreen {
//                    NewScreen(showNewScreen: $showNewScreen)
//                        .padding(.top, 50)
//                        .transition(.move(edge: .bottom))
//                        .animation(.spring())
//                }
//            }
//            .zIndex(2.0)
            
            // Method 3 - Animation Offset
            NewScreen(showNewScreen: $showNewScreen)
                .padding(.top, 50)
                .offset(y: showNewScreen ? 0 : UIScreen.main.bounds.height)
                .animation(.spring())
    
        }
    }
}

struct NewScreen: View {
    
    // Method 1 - Sheet
    //@Environment(\.presentationMode) var presentationMode
    
    // Method 2 - Transition
    //@Binding var showNewScreen: Bool
    
    // Method 3 - Animation Offset
    @Binding var showNewScreen: Bool
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.purple
                .ignoresSafeArea()
            
            Button(action: {
                // Method 1 - Sheet
                //presentationMode.wrappedValue.dismiss()
                
                // Method 2 - Transition
                //showNewScreen.toggle()
                
                // Method 3 - Animation Offset
                showNewScreen.toggle()
            }, label: {
                Image(systemName: "xmark")
                    .foregroundStyle(Color.white)
                    .font(.title)
                    .padding(20.0)
            })
        }
    }
}

#Preview {
    PopoverBootcamp()
    //NewScreen()
}
