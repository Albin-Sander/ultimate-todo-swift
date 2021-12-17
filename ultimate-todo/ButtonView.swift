//
//  ButtonView.swift
//  ultimate-todo
//
//  Created by Albin Sander on 2021-12-16.
//

import SwiftUI



struct ButtonView: View {
    @EnvironmentObject private var TextfieldClass: TextFieldModal
    
    
    
        
    var body: some View {
        Button(action: {
            
            TextfieldClass.buttonPressed()
            
        }, label: {
            Text("\(Image(systemName: TextfieldClass.buttonText))")
            
                .padding()
                .font(.system(.title))
                        .frame(width: 77, height: 70)
                        .foregroundColor(.white)
                
        })
            .background(.blue)
//            .cornerRadius(30)
            .clipShape(Capsule())
            .padding()
          
    }
        
        
}
    
    

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView()
    }
}
