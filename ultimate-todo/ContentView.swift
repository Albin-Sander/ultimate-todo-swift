//
//  ContentView.swift
//  ultimate-todo
//
//  Created by Albin Sander on 2021-12-16.
//

import SwiftUI



struct ContentView: View {
    @StateObject var todoItems = ListModal()
    @StateObject var hideInput = TextFieldModal()
    @State private var tapCount = UserDefaults.standard.string(forKey: "Tap")
    @AppStorage("todos") var todos:[String] = []
    
    var body: some View {
        NavigationView {
            VStack {
                ListView(todos: $todos)
                    .environmentObject(todoItems)
                
                if(!hideInput.hideInput) {
                    TextfieldView(todo: $todos)
                        .padding()
                        .environmentObject(todoItems)
                        .environmentObject(hideInput)
                        
                }
                    
                    
                
                HStack {
                    Spacer()
                    ButtonView()
                        .environmentObject(hideInput)
                        
                }
                
                
               
                
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarTitle(Text("Ultimate todo app").font(.system(size: 100.0)))
            
            
            
            
        }
       
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
