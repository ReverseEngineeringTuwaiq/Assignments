//
//  readAll.swift
//  MyDbApp
//
//  Created by 10M on 25/07/1445 AH.

import SwiftUI

struct Contacts: Identifiable, Decodable, Hashable{
    let id: Int
    let name: String
    let pNum: String
    let email: String
}

class ContactsViewModel: ObservableObject {
    @Published var contacts: [Contacts] = []
    
    func loadContacts() {
        var request = URLRequest(url: URL(string: "https://adpledxajblybfasgrnk.supabase.co/rest/v1/Contact ?select=*")!, timeoutInterval: Double.infinity)
        request.addValue("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFkcGxlZHhhamJseWJmYXNncm5rIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDcyMDUyMTQsImV4cCI6MjAyMjc4MTIxNH0.02YPKC0VRTTKFBqaLlyBDKhaz5FpWa8R5OXDGJaS8zs", forHTTPHeaderField: "apikey")
        request.addValue("Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFkcGxlZHhhamJseWJmYXNncm5rIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDcyMDUyMTQsImV4cCI6MjAyMjc4MTIxNH0.02YPKC0VRTTKFBqaLlyBDKhaz5FpWa8R5OXDGJaS8zs", forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            let decoder = JSONDecoder()
            print(String(data: data, encoding: .utf8)!)
            do {
                let decodedData = try decoder.decode([Contacts].self, from: data)
                DispatchQueue.main.async {
                    self.contacts = decodedData
                }
                print(decodedData)
            } catch {
                print(response!)
            }
        }
        
        task.resume()
    }
}







func addNew(name: String,Phone:String,Email: String){
    
    
    let parameters = "{ \"name\": \"\(name)\", \"pNum\": \"\(Phone)\",\"email\": \"\(Email)\"  }"
    let postData = parameters.data(using: .utf8)

    var request = URLRequest(url: URL(string: "https://adpledxajblybfasgrnk.supabase.co/rest/v1/Contact ")!,timeoutInterval: Double.infinity)
    request.addValue("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFkcGxlZHhhamJseWJmYXNncm5rIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDcyMDUyMTQsImV4cCI6MjAyMjc4MTIxNH0.02YPKC0VRTTKFBqaLlyBDKhaz5FpWa8R5OXDGJaS8zs", forHTTPHeaderField: "apikey")
    request.addValue("Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFkcGxlZHhhamJseWJmYXNncm5rIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDcyMDUyMTQsImV4cCI6MjAyMjc4MTIxNH0.02YPKC0VRTTKFBqaLlyBDKhaz5FpWa8R5OXDGJaS8zs", forHTTPHeaderField: "Authorization")
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


func deleteUser(user: String){
    
    
    
    var request = URLRequest(url: URL(string: "https://adpledxajblybfasgrnk.supabase.co/rest/v1/Contact ?name=eq.\(user)")!,timeoutInterval: Double.infinity)
    request.addValue("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFkcGxlZHhhamJseWJmYXNncm5rIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDcyMDUyMTQsImV4cCI6MjAyMjc4MTIxNH0.02YPKC0VRTTKFBqaLlyBDKhaz5FpWa8R5OXDGJaS8zs", forHTTPHeaderField: "apikey")
    request.addValue("Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFkcGxlZHhhamJseWJmYXNncm5rIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDcyMDUyMTQsImV4cCI6MjAyMjc4MTIxNH0.02YPKC0VRTTKFBqaLlyBDKhaz5FpWa8R5OXDGJaS8zs", forHTTPHeaderField: "Authorization")

    request.httpMethod = "DELETE"

    let task = URLSession.shared.dataTask(with: request) { data, response, error in
      guard let data = data else {
        print(String(describing: error))
        return
      }
      print(String(data: data, encoding: .utf8)!)
    }

    task.resume()

}




