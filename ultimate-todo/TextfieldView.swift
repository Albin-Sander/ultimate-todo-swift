//
//  TextfieldView.swift
//  ultimate-todo
//
//  Created by Albin Sander on 2021-12-16.
//

import SwiftUI

struct TextfieldView: View {
    @State private var todoItem = ""
    @EnvironmentObject private var todoList: ListModal
    @FocusState private var isFocused: Bool
    var body: some View {
        HStack {
            TextField("Enter todo", text: $todoItem)
                .textFieldStyle(.roundedBorder)
                .focused($isFocused)
            
            Button(action: {
                todoList.todos.append(todoItem)
                todoItem = ""
                isFocused = false
            }, label: {
                Text("Add")
            })
        }
    }
}

struct TextfieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextfieldView()
    }
}
