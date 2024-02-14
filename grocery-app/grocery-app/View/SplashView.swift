//
//  SplashView.swift
//  grocery-app
//
//  Created by Bushra Abuhaimed on 09/02/2024.
//

import SwiftUI

struct SplashView: View {
    
    @Binding internal var didSplash: Bool

    
    var body: some View {
        ZStack {
            Color.app_green
                .ignoresSafeArea()
            
            VStack {
                Image("groceryLogo")
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 75)
                    .colorInvert()
                
                Text("Grocery App")
                    .font(.headline)
                    .foregroundStyle(.white)
            }
            
        }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    withAnimation {
                        didSplash.toggle()
                    }
                }
            }
    }
}

#Preview {
    SplashView(didSplash: .constant(false))
}
