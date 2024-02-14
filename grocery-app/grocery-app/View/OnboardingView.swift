//
//  OnboardingView.swift
//  grocery-app
//
//  Created by Bushra Abuhaimed on 09/02/2024.
//

import SwiftUI

struct OnboardingView: View {
    
    @Binding internal var didOnboard: Bool
    
    @State private var current: Int = 0
    @State private var animatedCurrent: Int = 0
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Spacer()
                Button("Skip", action: skip)
                    .bold()
                    .foregroundStyle(Color.app_black)
                    
            }
            .padding(.horizontal)
            
            TabView(selection: $current) {
                VStack {
                    Image("waiting")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 200)
                        .padding(.bottom, 50)
                        .padding(.top, 100)
                    
                    Text("No waiting!")
                        .font(.title)
                        .bold()
                    
                    Text("You don't have to go to crowded stores\nat your busy days with our app\nit's just a click")
                        .font(.headline)
                        .bold()
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.gray)
                }
                .padding()
                .tag(0)
                
                VStack {
                    Image("shop")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    
                    Text("Relax and shop")
                        .font(.title)
                        .bold()
                    
                    Text("Browse the app and select all your\nneeded groceries")
                        .font(.headline)
                        .bold()
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.gray)
                }
                .padding()
                .tag(1)
                
                VStack {
                    Image("delivery")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    
                    Text("Delivery home")
                        .font(.title)
                        .bold()
                    
                    Text("All your groceries will deliver to your home\nat any day and time you choose")
                        .font(.headline)
                        .bold()
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.gray)
                }
                .padding()
                .tag(2)
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            
            Spacer()
            
            Button(action: next) {
                ZStack {
                    Circle()
                        .frame(width: 50, height: 50)
                        .foregroundStyle(Color.app_green)
                        .padding(5)
                        .overlay(
                            Circle()
                                .trim(from: 0, to: Double(Double(animatedCurrent) / 2))
                                .stroke(Color.green, lineWidth: 3)
                                .rotationEffect(Angle(degrees: -90))
                        )
                    
                    Image(systemName: "arrow.right")
                        .foregroundStyle(Color.white)
                }
                
            }
        }
        .onChange(of: current) { oldValue, newValue in
            withAnimation {
                animatedCurrent = newValue
            }
        }
    }
    
    private func next() {
        if current == 2 {
            skip()
        } else {
            withAnimation {
                current += 1
            }
        }
    }
    
    private func skip() {
        withAnimation {
            didOnboard.toggle()
        }
    }
}

#Preview {
    OnboardingView(didOnboard: .constant(false))
}
