//
//  ActionSheetBootcamp.swift
//  Bootcamp-SwiftUI
//
//  Created by lorenliang on 2023/12/11.
//

import SwiftUI

struct ActionSheetBootcamp: View {
    
    @State var showActionSheet: Bool = false
    
    @State var actionSheetOption: ActionSheetOptions = .isOtherPost
    
    enum ActionSheetOptions {
        case isMyPost
        case isOtherPost
    }
    
    var body: some View {
        
//        Button("Click me") {
//            showActionSheet.toggle()
//        }
//        .actionSheet(isPresented: $showActionSheet, content: {
//            //ActionSheet(title: Text("This is the title"))
//            getActionSheet()
//        })
        
        VStack {
            HStack {
                Circle()
                    .frame(width: 30, height: 30)
                Text("@username")
                
                Spacer()
                
                Button(action: {
                    actionSheetOption = .isMyPost
                    //actionSheetOption = .isOtherPost
                    showActionSheet.toggle()
                }, label: {
                    Image(systemName: "ellipsis")
                })
                //.accentColor(.primary)
            }
            .padding(.horizontal)
            
            Rectangle()
                .aspectRatio(1.0, contentMode: .fit)
            
        }
        .actionSheet(isPresented: $showActionSheet, content: {
            //ActionSheet(title: Text("This is the title"))
            getActionSheet()
        })
        
        
        
    }
    
    func getActionSheet() -> ActionSheet {
        //return ActionSheet(title: Text("This is the title"))
        
        let title: Text = Text("What would you like to do?")
        
        let sharedButton: ActionSheet.Button = .default(Text("Share"))
        
        let reportButton: ActionSheet.Button = .destructive(Text("Report"))
        
        let deleteButton: ActionSheet.Button = .destructive(Text("Delete"))
        
        let cancelButton: ActionSheet.Button = .cancel()
        
        switch actionSheetOption {
        case .isMyPost:
            return ActionSheet(
                title: title,
                message: nil,
                buttons: [sharedButton, reportButton, deleteButton, cancelButton]
            )
        case .isOtherPost:
            return ActionSheet(
                title: title,
                message: nil,
                buttons: [sharedButton, reportButton, cancelButton]
            )
        }
        
//        return ActionSheet(
//            title: Text("This is the title"),
//            message: Text("This is the message"),
//            buttons: [button1, button2, button3]
//        )
    }
}

#Preview {
    ActionSheetBootcamp()
}
