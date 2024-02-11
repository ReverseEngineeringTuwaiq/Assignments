//
//  AltAppTextField.swift
//  EVStationProject
//
//  Created by istabraq on 01/08/1445 AH.
//

import SwiftUI

struct AltAppTextField: View {
    var placeHolder: String
    @Binding var text: String
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                Text(placeHolder)
                    .foregroundColor(.black)
                    .padding(.leading)
            }
            
            TextField(placeHolder, text: $text)
                .padding()
                .overlay {
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color(uiColor: .black), lineWidth: 1)
                }
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
                .foregroundColor(.black)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.white)
    }
}

struct AltAppTextField_Previews: PreviewProvider {
    static var previews: some View {
        AltAppTextField(placeHolder: "Email", text: .constant(""))
    }
}

