//
//  ContentView.swift
//  MyDbApp
//
//  Created by 10M on 25/07/1445 AH.
//

import SwiftUI

struct ContentView: View {
    
    @State var name: String = ""
    @State var email: String = ""
    @State var phNum: String = ""
    @State var isShowingSheet = false


    @StateObject var veiwModule = ContactsViewModel()
    
    
    @State var path = [Int]()
    var body: some View {
        VStack {
            
            
            NavigationStack{
                List(veiwModule.contacts) { i in
                    NavigationLink(value: i){
                        Text(i.name)
                            .foregroundStyle(.black)
                            .font(.title3)
                            .bold()
                            .padding(.vertical,10)
                    }
                }.toolbar{
                    Button(action: {
                        isShowingSheet.toggle()
                    }) {
                        Image(systemName: "plus")
                            .font(.title)
                    }
                    .sheet(isPresented: $isShowingSheet) {
                        VStack {
                            
                            VStack{
                                TextField("Name:", text: $name)
                                    .textFieldStyle(.roundedBorder)
                                
                                TextField("Phone Number:", text: $phNum)
                                    .textFieldStyle(.roundedBorder)
                                
                                TextField("Email:", text: $email)
                                    .textFieldStyle(.roundedBorder)
                            }.padding(.horizontal)
                            HStack{
                                Spacer()
                                Button("Save"){
                                    addNew(name: name, Phone: phNum, Email: email)
                                    
                                    isShowingSheet.toggle()
                                }
                                Spacer()
                                Button("Dismiss",
                                       action: { isShowingSheet.toggle() })
                                Spacer()
                            }
                            .font(.title)
                        }
                        
                        
                    }
                }
                .navigationTitle("Contacts")
                    .navigationDestination(for: Contacts.self, destination: { ii in
                        ZStack{
                            VStack {
                                VStack {
                                    let firstChar = ii.name.prefix(1)
                                    Circle()
                                        .frame(width: 100,height: 100)
                                        .opacity(0.1)
                                        .foregroundColor(.black)
                                 
                                        .overlay {
                                            
                                            Text(firstChar)
                                                .font(.largeTitle)
                                                .bold()
                                    }
                                    
                                    Text(ii.name).font(.largeTitle)
                                        .bold()
                                    Rectangle().frame(height: 100).opacity(0.1).overlay {
                                        VStack{
                                            Text("Mobile").bold()
                                                .font(.title2)
                                                .padding(.vertical,1)
                                            Text(ii.pNum).padding(.leading,60).frame(width: 300)
                                        }.padding(.trailing,310).padding(.bottom,25)
                                    }
                                    
                                    
                                    
                                }
                                Rectangle().frame(height: 100).opacity(0.1).overlay {

                                VStack{
                                    Text("Email").bold()
                                        .padding(.trailing,310)
                                        .font(.title2)
                                        .padding(.vertical,1)
                                    Text(ii.email).frame(width: 300).foregroundStyle(.blue)
                                }.padding(.bottom,25)}
                                Button("Delete"){
                                    
                                    //action
                                    deleteUser(user: ii.name)
                                }.foregroundColor(.red).padding(.top,30)
                                
                                
                            }
                            
                            
                        }
                    })

                    .toolbarTitleDisplayMode(.large)
                .onAppear{
                    veiwModule.loadContacts()
                }
            }
                
        }
            
            
        }


                }


        
    


#Preview {
    ContentView()
}
