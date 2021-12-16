//
//  ListView.swift
//  ultimate-todo
//
//  Created by Albin Sander on 2021-12-16.
//

import SwiftUI



class ListModal: ObservableObject {
    @Published var todos: [String] = []
    
    
    
}

struct ListView: View {
    let tests = ["hej", "tja"]
    @EnvironmentObject private var todoList: ListModal
    
    func deleteItems(at offsets: IndexSet) {
        todoList.todos.remove(atOffsets: offsets)
    }
    var body: some View {
        List {
            ForEach($todoList.todos, id: \.self) { todo in
                Text(todo.wrappedValue)
            }
            .onDelete(perform: deleteItems)
        }
        .toolbar {
            EditButton()
        }
        
        
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
