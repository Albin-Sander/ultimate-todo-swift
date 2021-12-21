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
            if(colorScheme == .light) {
                TextField("Enter todo", text: $todoItem)
                    .padding(.all, 10)
                    .background(Color(uiColor: .secondarySystemBackground))
                    .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.gray, lineWidth: 4)
                        )
               
                    .foregroundColor(Color.white)
                    .focused($isFocused)
            } else {
                TextField("Enter todo", text: $todoItem)
                    .padding(.all, 10)
                    .background(Color.white)
                    .cornerRadius(25)
                    .foregroundColor(Color.black)
                    .focused($isFocused)
            }
            
            
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
