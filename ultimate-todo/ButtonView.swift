//
//  ButtonView.swift
//  ultimate-todo
//
//  Created by Albin Sander on 2021-12-16.
//

import SwiftUI



struct ButtonView: View {
    @EnvironmentObject private var hideInput: TextFieldModal
    var body: some View {
        Button(action: {
            
            hideInput.hideInput = false
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
