import SwiftUI

struct Contacts: Identifiable, Decodable{
    let id: Int
    let name: String
    let phone: String
    let email: String
}

class ContactsViewModel: ObservableObject {
    @Published var contacts: [Contacts] = []
    
    func addContact(name: String, phone: String, email: String){
        let parameters = """
                            {
                                "name": "\(name)",
                                "phone": "\(phone)",
                                "email": "\(email)"
                            }
                            """
        let postData = parameters.data(using: .utf8)

        var request = URLRequest(url: URL(string: "https://qwkugrfsqxmpevsnnkbr.supabase.co/rest/v1/Contacts")!,timeoutInterval: Double.infinity)
        request.addValue("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InF3a3VncmZzcXhtcGV2c25ua2JyIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDcyMDUxNDIsImV4cCI6MjAyMjc4MTE0Mn0.NzP81UfliuQMhf6Q4YI9R2Qs8x0-4w1ahT0fB6cBbT4", forHTTPHeaderField: "apikey")
        request.addValue("Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InF3a3VncmZzcXhtcGV2c25ua2JyIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDcyMDUxNDIsImV4cCI6MjAyMjc4MTE0Mn0.NzP81UfliuQMhf6Q4YI9R2Qs8x0-4w1ahT0fB6cBbT4", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("return=minimal", forHTTPHeaderField: "Prefer")

        request.httpMethod = "POST"
        request.httpBody = postData

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard data != nil else {
            print(String(describing: error))
            return
          }
        }

        task.resume()

    }
    
    func loadContacts() {
        var request = URLRequest(url: URL(string: "https://qwkugrfsqxmpevsnnkbr.supabase.co/rest/v1/Contacts?select=*")!, timeoutInterval: Double.infinity)
        request.addValue("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InF3a3VncmZzcXhtcGV2c25ua2JyIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDcyMDUxNDIsImV4cCI6MjAyMjc4MTE0Mn0.NzP81UfliuQMhf6Q4YI9R2Qs8x0-4w1ahT0fB6cBbT4", forHTTPHeaderField: "apikey")
        request.addValue("Bearer eyJhbGciOiJIUzI1NiIsImtpZCI6InJnYXM0Snd6V0JyOU1tWXYiLCJ0eXAiOiJKV1QifQ.eyJhdWQiOiJhdXRoZW50aWNhdGVkIiwiZXhwIjoxNzA3MzIxNDg0LCJpYXQiOjE3MDczMTc4ODQsImlzcyI6Imh0dHBzOi8venJwdnJoemV1dG1pcnp3eHlibmcuc3VwYWJhc2UuY28vYXV0aC92MSIsInN1YiI6ImU2OTRlZjYzLTU1ZDMtNDExMS1iZTBhLTRlNWJlYzRiZDJmZiIsImVtYWlsIjoiZnVybml0dXJlQDEzMzdkZXZpbC5tZSIsInBob25lIjoiIiwiYXBwX21ldGFkYXRhIjp7InByb3ZpZGVyIjoiZW1haWwiLCJwcm92aWRlcnMiOlsiZW1haWwiXX0sInVzZXJfbWV0YWRhdGEiOnt9LCJyb2xlIjoiYXV0aGVudGljYXRlZCIsImFhbCI6ImFhbDEiLCJhbXIiOlt7Im1ldGhvZCI6InBhc3N3b3JkIiwidGltZXN0YW1wIjoxNzA3MzE3ODg0fV0sInNlc3Npb25faWQiOiI0MTg4MmU2Ni02NDQxLTQyMzgtODQwMC1iNDE0YTFhOGI2MjMifQ.pQfcndR3SCmQLuvhlkpSSJTmm_bn86f651GkyiGl9NI", forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            let decoder = JSONDecoder()
            do {
                let decodedData = try decoder.decode([Contacts].self, from: data)
                DispatchQueue.main.async {
                    self.contacts = decodedData
                }
//                print(decodedData)
            } catch {
                print(response!)
            }
        }
        
        task.resume()
    }
}

