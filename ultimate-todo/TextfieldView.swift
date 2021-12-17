//
//  TextfieldView.swift
//  ultimate-todo
//
//  Created by Albin Sander on 2021-12-16.
//

import SwiftUI

class TextFieldModal: ObservableObject {
    @Published var hideInput = true
}

struct TextfieldView: View {
    @State private var todoItem = ""
    @EnvironmentObject private var todoList: ListModal
    @EnvironmentObject private var hideInput: TextFieldModal
    @FocusState private var isFocused: Bool
    
    var body: some View {
        HStack {
            TextField("Enter todo", text: $todoItem)
                .padding(.all, 10)
                .background(Color.white)
                .foregroundColor(Color.black)
                .cornerRadius(25)
                
                
                .focused($isFocused)
            
            Button(action: {
                if(!todoItem.isEmpty) {
                    todoList.todos.append(todoItem)
                    todoItem = ""
                    isFocused = false
                    hideInput.hideInput = true
                }
                
            }, label: {
                Text("Add")
            })
                .padding(.leading, 10)
        }
    }
}

struct TextfieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextfieldView()
    }
}
