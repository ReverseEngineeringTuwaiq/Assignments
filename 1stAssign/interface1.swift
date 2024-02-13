//
//  interface1.swift
//  swiftAssignment
//
//  Created by Bushra Abuhaimed on 19/07/1445 AH.
//

import SwiftUI

struct interface1: View {
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "arrow.backward")
                    .foregroundStyle(.black)
                    .bold()
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,  alignment: .leading)
                    .padding([.leading, .bottom], 30)
            }
            
            VStack {
                VStack(spacing: 30) {
                    Image(systemName: "homekit")
                        .resizable()
                        .frame(width: 120, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    Text("Log in to Your Account")
                        .font(.system(size: 30).bold())
                }
            }//end of 1st vstack
            
            VStack(spacing: 0) {
                RoundedRectangle(cornerRadius: 15)
                    .padding()
                    .frame(height: 90, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.gray.opacity(0.1))
                    .overlay{
                        HStack {
                            Image(systemName: "envelope.fill")
                                .opacity(0.3)
                            
                            Text("Email")
                                .opacity(0.3)
                            
                        }// HStack end
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,  alignment:.leading)
                        .padding(.horizontal,35)
                        
                    }//overlay end
                
                VStack {
                    RoundedRectangle(cornerRadius: 15)
                        .padding()
                        .frame(height: 90, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.gray.opacity(0.1))
                        .overlay{
                            HStack {
                                Image(systemName: "exclamationmark.lock.fill")
                                    .opacity(0.3)
                                    .font(.system(size: 25))
                                Text("Password")
                                    .opacity(0.3)
                            }// HStack end
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,  alignment:.leading)
                            .padding(.horizontal,35)
                            
                            HStack{
                                Image(systemName: "eye.fill")
                                    .opacity(0.3)
                                    .font(.system(size: 20))
                                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,  alignment: .trailing)
                                    .padding(.trailing,30)
                            }
                        }//overlay end
                }
            }
            
            HStack{
                Image(systemName: "app.badge.checkmark")
                    .font((.system(size: 25)))
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                Text("Remember me")
            }
            VStack(spacing: 40) {
                VStack {
                    Button(action: {}) {
                        Text("Sign in")
                            .padding()
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .border(.purple)
                            .cornerRadius(30)
                            .padding(.horizontal)
                    }
                    
                    Text("Forget the password?")
                        .foregroundStyle(.blue)
                }
                
                VStack(spacing: 30) {
                    Text("or continue with ")
                    
                    HStack {
                        rectanglesView()
                    }
                    
                    HStack {
                        Text("Don't have an account?")
                        Text("Sign up")
                            .foregroundColor(.blue)
                    }
                }
            }
        }// end of body
    }
}

#Preview {
    interface1()
}
