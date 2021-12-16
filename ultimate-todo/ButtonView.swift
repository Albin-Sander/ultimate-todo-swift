//
//  ButtonView.swift
//  ultimate-todo
//
//  Created by Albin Sander on 2021-12-16.
//

import SwiftUI

class ButtonModel: ObservableObject {
    @Published var buttonPressed = false
}

struct ButtonView: View {
    @EnvironmentObject private var buttonPressed: ButtonModel
    var body: some View {
        Button(action: {
            buttonPressed.buttonPressed = true
        }, label: {
            Text("+")
                .padding()
                .font(.system(.largeTitle))
                        .frame(width: 77, height: 70)
                        .foregroundColor(.white)
                
        })
            .background(.blue)
            .cornerRadius(35)
            .padding()
    }
        
}
    

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView()
    }
}
