//
//  SideMenuHeaderView.swift
//  FitnessProject
//
//  Created by Osama on 29/07/1445 AH.
//

import SwiftUI

struct SideMenuHeaderView: View {
    var body: some View {
        HStack {
            Image("proF")
             // .imageScale(.large)
                .resizable()
                .frame(width: 69, height: 69)
                .clipShape(Circle())
                .padding(.vertical)
            
            VStack (alignment: .leading, spacing: 6) {
                Text("Osama")
                    .font(.title3)
                    .padding()
            }
        }
    }
}

#Preview { SideMenuHeaderView() }
