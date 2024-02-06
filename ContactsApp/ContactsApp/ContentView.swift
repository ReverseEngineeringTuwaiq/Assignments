import SwiftUI



struct Contacts: Identifiable, Encodable, Decodable {
    var id: Int
    var name: String
    var phoneNumber: String
}



struct ContentView: View {
    @State private var name = ""
    @State private var phoneNumber = ""
    @State private var contacts = [Contacts]()

    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Add Contact")) {
                        TextField("Name", text: $name)
                        TextField("Phone Number", text: $phoneNumber)
                        Button("Add Contact") {
                            addContact(name: name , phoneNumber: phoneNumber)
                            name = ""
                            phoneNumber = ""
                        }
                    }

                    Section(header: Text("Contacts")) {
                        List(contacts) { contact in
                            Text(contact.name)
                        }
                    }
                }
            }
            .navigationBarTitle("Contacts")
        }
        .onAppear {
            fetchContacts()
        }
    }
    func fetchContacts() {
        guard let url = URL(string: "https://bkuesdhmgljhkzpccnfa.supabase.co/rest/v1/Contacts?select=*") else {
            print("Invalid URL")
            return
        }

        var request = URLRequest(url: url)
        request.addValue("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJrdWVzZGhtZ2xqaGt6cGNjbmZhIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDcyMDUyNTQsImV4cCI6MjAyMjc4MTI1NH0.dIyy78CrHXLPxr7Ur1LKq3LdC16x5wLN-Buu9eMb_M0", forHTTPHeaderField: "apikey")
        
        request.addValue("Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJrdWVzZGhtZ2xqaGt6cGNjbmZhIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDcyMDUyNTQsImV4cCI6MjAyMjc4MTI1NH0.dIyy78CrHXLPxr7Ur1LKq3LdC16x5wLN-Buu9eMb_M0", forHTTPHeaderField: "Authorization")

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                if let error = error {
                    print("Error: \(error)")
                }
                return
            }

            do {
                let decodedData = try JSONDecoder().decode([Contacts].self, from: data)
                DispatchQueue.main.async {
                    self.contacts = decodedData
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }
        
        task.resume()
    }

        
    func addContact(name: String, phoneNumber: String) {
        let parameters = "{ \"name\": \"\(name)\", \"phoneNumber\": \"\(phoneNumber)\" }"
        let postData = parameters.data(using: .utf8)
        
        var request = URLRequest(url: URL(string: "https://bkuesdhmgljhkzpccnfa.supabase.co/rest/v1/Contacts")!,timeoutInterval: Double.infinity)
        request.addValue("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJrdWVzZGhtZ2xqaGt6cGNjbmZhIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDcyMDUyNTQsImV4cCI6MjAyMjc4MTI1NH0.dIyy78CrHXLPxr7Ur1LKq3LdC16x5wLN-Buu9eMb_M0", forHTTPHeaderField: "apikey")
        request.addValue("Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJrdWVzZGhtZ2xqaGt6cGNjbmZhIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDcyMDUyNTQsImV4cCI6MjAyMjc4MTI1NH0.dIyy78CrHXLPxr7Ur1LKq3LdC16x5wLN-Buu9eMb_M0", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("return=minimal", forHTTPHeaderField: "Prefer")
        
        request.httpMethod = "POST"
        request.httpBody = postData
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            print(String(data: data, encoding: .utf8)!)
        }
        
        task.resume()
    }
        }
    

#Preview{
    ContentView()
}
