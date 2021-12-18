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

extension Array: RawRepresentable where Element: Codable {
    public init?(rawValue: String) {
        guard let data = rawValue.data(using: .utf8),
              let result = try? JSONDecoder().decode([Element].self, from: data)
        else {
            return nil
        }
        self = result
    }

    public var rawValue: String {
        guard let data = try? JSONEncoder().encode(self),
              let result = String(data: data, encoding: .utf8)
        else {
            return "[]"
        }
        return result
    }
}

struct ListView: View {
    @EnvironmentObject private var todoList: ListModal
    
   
   
    
    @Binding var todos: [String]
    

    
    func deleteItems(at offsets: IndexSet) {
        todoList.todos.remove(atOffsets: offsets)
        todos.remove(atOffsets: offsets)
    }
    var body: some View {
        List {
            ForEach(todos, id: \.self) { todo in
                Text("\(todo)")
            }
            .onDelete(perform: deleteItems)
        }
        .toolbar {
            EditButton()
        }
        
        
    }
}

//struct ListView_Previews: PreviewProvider {
//    static var previews: some View {
//        ListView()
//    }
//}
