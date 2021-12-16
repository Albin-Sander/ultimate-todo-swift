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
    
    var body: some View {
        NavigationView {
            VStack {
                ListView()
                    .environmentObject(todoItems)
                
                if(!hideInput.hideInput) {
                TextfieldView()
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
            .navigationTitle("Ultimate Todo")
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
