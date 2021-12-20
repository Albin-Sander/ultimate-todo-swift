//
//  TextfieldView.swift
//  ultimate-todo
//
//  Created by Albin Sander on 2021-12-16.
//

import SwiftUI

class TextFieldModal: ObservableObject {
    @Published var hideInput = true
    @Published var buttonText = "plus"
    
    func buttonPressed() {
        if(hideInput) {
            self.hideInput = false
            buttonText = "minus"
        } else {
            self.hideInput = true
            buttonText = "plus"
        }
    }
    
    func inputFieldButtonPressed() {
        buttonText = "plus"
    }
}

struct TextfieldView: View {
    @AppStorage("todoItem") private var todoItem = ""
    @EnvironmentObject private var todoList: ListModal
    @EnvironmentObject private var hideInput: TextFieldModal
    @FocusState private var isFocused: Bool
    @Binding var todo: [String]
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        HStack {
            TextField("Enter todo", text: $todoItem)
                
                .padding(.all, 10)
                
                .background(colorScheme == .light ? Color(uiColor: .secondarySystemBackground) : Color.white)
          
                .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(colorScheme == .light ? Color.gray : Color(uiColor: .systemBackground), lineWidth: 4)
                    )
            
                
//                 .cornerRadius(25)
                
                .foregroundColor(colorScheme == .light ? Color.white : Color.black)
                
                .focused($isFocused)
            
            Button(action: {
                if(!todoItem.isEmpty) {
                    todo.append(todoItem)
                    todoItem = ""
                    isFocused = false
                    hideInput.hideInput = true
                    
                    hideInput.inputFieldButtonPressed()
                }
                
            }, label: {
                Text("Add")
                
            })
                .padding(.leading, 10)
        }
    }
}

//struct TextfieldView_Previews: PreviewProvider {
//    static var previews: some View {
//        TextfieldView()
//    }
//}
