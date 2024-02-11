//
//  SideMenuView.swift
//  FitnessProject
//
//  Created by Osama on 28/07/1445 AH.
//

import SwiftUI

struct SideMenuView: View {
    @Binding var isShowin: Bool
    var body: some View {
        ZStack{
            if isShowin{
                Rectangle()
                    .opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture { isShowin.toggle() }
                
                HStack {
                    VStack(alignment: .leading, spacing: 32){
                        SideMenuHeaderView()
                            
                        Spacer()
                    } .padding()
                      .background(.kolorB)
                      .shadow(color: .black, radius: 16)
                      .frame(width: 270, alignment: .leading)
                    Spacer()
                }
            }
        }
    }
}

#Preview { SideMenuView(isShowin: .constant(true)) }
