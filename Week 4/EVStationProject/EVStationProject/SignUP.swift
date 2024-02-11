//
//  SignIN.swift
//  EVStationProject
//
//  Created by istabraq on 26/07/1445 AH.
//

import SwiftUI

struct SignUP: View {
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var phone: String = ""
    @State private var password: String = ""
    
    // Inject AuthenticationManager
    //@ObservedObject var AuthViewModel: AuthViewModel
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.1)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Create Account")
                    .font(.title3)
                    .bold()
                    .foregroundColor(.black)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .center)
                
                Text("Fill your information below to create account in EV Charging App")
                    .font(.caption)
                    .bold()
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity, alignment: .center)
                
                VStack {
                    TextField("Username", text: $username)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(8.0)
                        .padding(.horizontal)
                        .shadow(radius: 5)
                    
                    TextField("Email", text: $email)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(8.0)
                        .padding(.horizontal)
                        .keyboardType(.emailAddress)
                        .shadow(radius: 5)
                    
                    TextField("Phone", text: $phone)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(8.0)
                        .padding(.horizontal)
                        .keyboardType(.phonePad)
                        .shadow(radius: 5)
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(8.0)
                        .padding(.horizontal)
                        .shadow(radius: 5)
                    
                    Button(action: {
                        Task {
                            // Perform sign-up action asynchronously
                          //  await AuthViewModel.signup(email: email, password: password)
                        }}) {
                        Text("Sign Up")
                            .font(.title3)
                            .bold()
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.green)
                            .cornerRadius(8.0)
                            .padding(.horizontal)
                            .shadow(radius: 5)
                    }
                    .padding(.top, 20)
                    
                    Spacer()
                }
                .padding()
            }
            .padding()
            .foregroundColor(.green)
            .navigationBarTitle("Sign Up", displayMode: .inline)
        }
    }
}
