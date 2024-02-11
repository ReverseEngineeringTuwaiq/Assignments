//
//  AppSecureField.swift
//  EVStationProject
//
//  Created by istabraq on 01/08/1445 AH.
//

import SwiftUI

struct AppSecureField: View {
    var placeHolder: String
    @Binding var text: String
    
    var body: some View {
        SecureField(placeHolder, text: $text)
            .padding()
            .overlay {
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color(uiColor: .secondaryLabel), lineWidth: 1)
            }
            .textInputAutocapitalization(.never)
            .autocorrectionDisabled()
    }
}

struct AppSecureField_Previews: PreviewProvider {
    static var previews: some View {
        AppSecureField(placeHolder: "password", text: .constant(""))
    }
}
