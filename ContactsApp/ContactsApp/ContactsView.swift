
import SwiftUI

struct ContactsView: View {
    @StateObject var Model = ContactsViewModel()
    @State var showSheet = false
    @State var name = ""
    @State var phone = ""
    @State var email = ""
    var body: some View {
        NavigationStack {
            List(Model.contacts) { contact in
                VStack(alignment: .leading) {
                    NavigationLink(destination: ContactInfoView(name: contact.name, phone: contact.phone, email: contact.email)) {
                        Text(contact.name).font(.headline)
                    }
                }
            }
            .navigationTitle("Contacts")
            .navigationBarTitleDisplayMode(.automatic)
            .toolbar(content: {
                Button(action: {
                    showSheet.toggle()
                }) {
                Image(systemName: "plus")
                }
                .sheet(isPresented: $showSheet, content: {
                    ZStack {
                        Color.gray.opacity(0.1)
                            .ignoresSafeArea()
                        VStack{
                            HStack {
                                Button("Cancel"){
                                    showSheet = false
                                }
                                Spacer()
                                Button("Done"){
                                    Model.addContact(name: name, phone: phone, email: email)
                                    showSheet = false
                                }
                            }
                            
                            TextField("Name", text: $name)
                                .textFieldStyle(.roundedBorder)
                            TextField("Phone", text: $phone)
                                .textFieldStyle(.roundedBorder)
                            TextField("Email", text: $email)
                                .textFieldStyle(.roundedBorder)
                        }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity, alignment: .top).padding()
                    }
                })
            })
            .onAppear {
                Model.loadContacts()
            }
            .onChange(of: showSheet){
                Model.loadContacts()
            }
        }
    }
}


#Preview {
    ContactsView()
}
