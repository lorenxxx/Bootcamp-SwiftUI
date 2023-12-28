//
//  AlertBootcamp.swift
//  Bootcamp-SwiftUI
//
//  Created by lorenliang on 2023/12/11.
//

import SwiftUI

struct AlertBootcamp: View {
    
    @State var showAlert: Bool = false
    
    @State var alertTitle: String = ""
    
    @State var alertMessage: String = ""
    
    @State var bgColor: Color = Color.yellow
    
    var body: some View {
        ZStack {
            bgColor.ignoresSafeArea()
            
            VStack {
                Button("Button 1") {
                    alertTitle = "Error1"
                    alertMessage = "Error Message 1"
                    showAlert.toggle()
                }
                
                Button("Button 2") {
                    alertTitle = "Error2"
                    alertMessage = "Error Message 2"
                    showAlert.toggle()
                }
            }
            .alert(isPresented: $showAlert, content: {
                //Alert(title: Text("There was a error!"))
                getAlert()
            })
        }
    }
    
    func getAlert() -> Alert {
        return Alert(
            title: Text(alertTitle),
            message: Text(alertMessage),
            dismissButton: .default(Text("OK"))
        )
        
//        return Alert(
//            title: Text("This is the title"),
//            message: Text("this is the message"),
//            primaryButton: .destructive(Text("Delete"), action: {
//                bgColor = .red
//            }),
//            secondaryButton: .cancel()
//        )
    }
}

#Preview {
    AlertBootcamp()
}
