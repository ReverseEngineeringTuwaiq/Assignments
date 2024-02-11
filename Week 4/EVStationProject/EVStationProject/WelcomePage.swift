//
//  WelcomePage.swift
//  EVStationProject
//
//  Created by istabraq on 26/07/1445 AH.
//

import SwiftUI

struct WelcomePage: View {
    @State  var blueCircle: Bool = false
    @State  var bigBlueCircle: Bool = false
    @State var appUser: AppUser? = nil
    
    let green2 = Color(red: 0, green: 0.4863, blue: 0.1529, opacity: 1)
    var body: some View {
        ZStack{
            
            Image("EVLogo")
                .resizable()
                .frame(width: 250, height: 200)
                .padding([.bottom, .trailing], -37.0)
            
            // Big Blue Circle
            Circle()
                .frame(width: 200, height: 200)
                .foregroundColor(green2)
                .opacity(bigBlueCircle ? 0 : 0.5)
                .scaleEffect(bigBlueCircle ? 1.4 : 0)
                .onAppear() {
                    withAnimation(.easeOut(duration: 2).delay(2).repeatForever(autoreverses: false)) {
                        bigBlueCircle.toggle()
                    }
                }
            
            //White Border circle
            Circle()
                .frame(width: 18)
                .foregroundColor(.clear).opacity(0.9)
            
            //Small Blue circle
            Circle()
                .frame(width: 14)
                .foregroundColor(.white).opacity(0.1)
                .scaleEffect(blueCircle ? 0.9 : 1.1)
                .onAppear() {
                    withAnimation(.easeInOut(duration: 2).repeatForever(autoreverses: true)) {
                        blueCircle.toggle()
                    }
                }
        }
        
        VStack {
            HStack {
                Text("Welcome To EV Map Station")
                    .font(.title2)
                    .bold()
                    .foregroundColor(green2)
                    .italic()
                    .padding()
            }
            
            VStack {
                SignInView(appUser: $appUser)
                }
                .cornerRadius(10)
                .padding()
            }
            
        }
    }

#Preview {
    WelcomePage()
}
