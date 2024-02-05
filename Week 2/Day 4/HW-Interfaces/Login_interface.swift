//
//  ContentView.swift
//  HW-Interfaces
//
//  Created by istabraq on 19/07/1445 AH.
//

import SwiftUI

struct Login_interface: View {
    var body: some View {
        HStack{
            Image(systemName: "arrow.left")
                .bold()
                Spacer()
                .foregroundColor(.black)
        } .padding()
        ZStack {
            // House body
            Image(systemName: "square.fill")
                .resizable()
                .frame(width: 80, height: 50) // Adjusted size for house body
                .foregroundColor(.blue)
            // Roof
            Image(systemName: "triangle.fill")
                .resizable()
                .frame(width: 95, height: 50) // Adjusted size for roof
                .foregroundColor(.blue)
                .offset(y: -30) // Positioned above the house body
            //share
            Image(systemName: "shareplay")
                .resizable()
                .frame(width: 60,height: 50)
                .foregroundColor(.white)
        }
        VStack{
            Text("Login to Your Account")
                .bold()
                .font(.largeTitle)
        }
        ZStack(alignment: .leading){
            HStack{
                Image(systemName: "envelope.fill")
                    .foregroundStyle(.gray)
                    .font(.system(size: 20))
                    .fontWeight(.thin)
                Text("Email")
                    .opacity(0.3)
                Spacer()
               
            }
                .padding(.leading)
            RoundedRectangle(cornerRadius: 25.0)
                .fill(.gray.opacity(0.1))
                .frame(height: 60)
               
        }
        .padding(.horizontal)
        ZStack(alignment: .leading){
            HStack{
                Image(systemName: "lock.fill")
                    .foregroundStyle(.gray)
                    .font(.system(size: 25))
                    .fontWeight(.thin)
                Text("Password")
                    .opacity(0.3)
                Spacer()
                Image(systemName: "eye.slash.fill")
                    .foregroundStyle(.gray)
                    .font(.system(size: 20))
                    .fontWeight(.thin)
                    .padding()
            } .padding(.leading)
            RoundedRectangle(cornerRadius: 25.0)
                .fill(.gray.opacity(0.1))
                .frame(height: 60)
        }.padding(.horizontal)
        
        HStack (alignment: .center){
            Image(systemName: "square")
                .foregroundStyle(.blue)
                .font(.system(size: 20))
                .fontWeight(.heavy)
            VStack (alignment: .leading)
            {
                Text("Remember me")
                    .bold()
            }.padding()
        }
            VStack{
                Button(action: {}) {
                    Text("Sign in")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(100)
                }.padding()
                Text("Forget the password?")
                    .foregroundStyle(.blue)
                    .bold()
                    .font(.callout)
            }.padding()
        VStack {
            // Grey lines on each side
            HStack {
                Rectangle()
                    .fill(Color.gray)
                    .frame(height: 0.2)
                Text("or continue with")
                    .foregroundColor(.gray)
                    .bold()
                    .font(.callout)
                    .padding(.horizontal,0)
                Rectangle()
                    .fill(Color.gray)
                    .frame(height: 0.2)
            }
        }
            .padding(.vertical, 20)
        HStack(spacing: 30) {
            Image("Facebook")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 30)
                .padding()
                .overlay(
                RoundedRectangle(cornerRadius: 8)
               .stroke(Color.gray, lineWidth: 1)
                )
            Image("Google")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 30)
                .padding()
                .overlay(
                RoundedRectangle(cornerRadius: 8)
               .stroke(Color.gray, lineWidth: 1)
                )
            Image(systemName: "applelogo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 30)
                .padding()
                .overlay(
                RoundedRectangle(cornerRadius: 8)
               .stroke(Color.gray, lineWidth: 1)
                )
                }
        VStack {
            HStack {
                Text("Don't have an account?")
                    .foregroundColor(.gray) // Set the color to gray
                Text("Sign up")
                    .foregroundColor(.blue) // Set the color to blue
            }.padding()
        }
        
            }
                }

#Preview {
    Login_interface()
}
