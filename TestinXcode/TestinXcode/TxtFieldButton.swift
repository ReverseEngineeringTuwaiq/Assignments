//
//  TxtFieldButton.swift
//  TestinXcode
//
//  Created by Osama on 20/07/1445 AH.
//

import SwiftUI

struct TxtFieldButton: View {
    @State var username = "g"
    var body: some View {
        VStack(spacing: 0){
            TextField("", text: $username)
                .textFieldStyle(.roundedBorder)
                .padding(.bottom)
        }
        
        Button("show"){}
    }
}
#Preview { TxtFieldButton() }
