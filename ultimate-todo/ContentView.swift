//
//  ContentView.swift
//  ultimate-todo
//
//  Created by Albin Sander on 2021-12-16.
//

import SwiftUI



struct ContentView: View {
    @StateObject var buttonPressed = ButtonModel()
    @StateObject var todoItems = ListModal()
    
    var body: some View {
        NavigationView {
            VStack {
                ListView()
                    .environmentObject(todoItems)
                
                if(buttonPressed.buttonPressed) {
                TextfieldView()
                        .environmentObject(todoItems)
                }
                
                HStack {
                    Spacer()
                    ButtonView()
                        .environmentObject(buttonPressed)
                        
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
