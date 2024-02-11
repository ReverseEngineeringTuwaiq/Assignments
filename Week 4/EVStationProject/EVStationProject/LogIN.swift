////
////  LogIN.swift
////  EVStationProject
////
////  Created by istabraq on 26/07/1445 AH.
////
//
//import SwiftUI
//
//struct LogIN: View {
//    var body: some View {
//            @State  var email: String = ""
//            @State  var password: String = ""
//            
//        ZStack {
//                    Color.gray.opacity(0.1)
//                        .edgesIgnoringSafeArea(.all)
//                    
//                    VStack {
//                        Text("Login")
//                            .font(.title)
//                            .bold()
//                            .foregroundColor(.black)
//                            .padding()
//                            .frame(maxWidth: .infinity, alignment: .center)
//                        Text("Hi! Welcome back, you’ve been missed")
//                            .font(.caption)
//                            .bold()
//                            .foregroundColor(.gray)
//                        VStack {
//                            TextField("Email", text: $email)
//                                .padding()
//                                .background(Color.white)
//                                .cornerRadius(8.0)
//                                .padding(.horizontal)
//                                .keyboardType(.emailAddress)
//                                .shadow(radius: 5)
//                            
//                            SecureField("Password", text: $password)
//                                .padding()
//                                .background(Color.white)
//                                .cornerRadius(8.0)
//                                .padding(.horizontal)
//                                .shadow(radius: 5)
//                            Button(action: {
//                                // Perform login action
//                                print("Login button tapped")
//                            }) {
//                                Text("Login")
//                                    .font(.title3)
//                                    .bold()
//                                    .foregroundColor(.white)
//                                    .padding()
//                                    .frame(maxWidth: .infinity)
//                                    .background(.green)
//                                    .cornerRadius(8.0)
//                                    .padding(.horizontal)
//                                    .shadow(radius: 5)
//                            }
//                            .padding(.top, 30)
//                            
//                            HStack{
//                                Text("Don't have an account?")
//                                    .foregroundColor(.black)
//                                    .padding()
//                                NavigationLink(destination: SignUP()) {
//                                    Text("Sign Up")
//                                        .foregroundColor(.green)
//                                        .padding()}
//                            }
//                            Spacer()
//                        }
//                        .padding()
//                    }
//                    .padding()
//                    .foregroundColor(.blue)
//                    .navigationBarTitle("Login", displayMode: .inline)
//                }
//            }
//        }
//
//#Preview {
//    LogIN()
//}
