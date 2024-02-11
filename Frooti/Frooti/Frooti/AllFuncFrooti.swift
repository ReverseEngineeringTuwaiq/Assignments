
import Foundation

struct Froots: Decodable, Identifiable, Hashable {
    var id: Int
    var fruit: String
    var pic: String
    var description: String
    var price: String
}





class FrtViewModel: ObservableObject {
    @Published var frtt: [Froots] = []
    
    
    func readAll() {
        guard let url = URL(string: "https://wrkyyersgqlfzfmjyycj.supabase.co/rest/v1/frootiStock?select=*") else {
            print("Invalid URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.addValue("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Indya3l5ZXJzZ3FsZnpmbWp5eWNqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDczMjQ3MjAsImV4cCI6MjAyMjkwMDcyMH0.ZGBbKDdcJnJ5F-_On2hbRAPgxwwqeD5fmk-nUNnZBT8", forHTTPHeaderField: "apikey")
        request.addValue("Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Indya3l5ZXJzZ3FsZnpmbWp5eWNqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDczMjQ3MjAsImV4cCI6MjAyMjkwMDcyMH0.ZGBbKDdcJnJ5F-_On2hbRAPgxwwqeD5fmk-nUNnZBT8", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                if let error = error {
                    print("Error fetching data: \(error)")
                }
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let fruits = try decoder.decode([Froots].self, from: data)
                DispatchQueue.main.async {
                    self.frtt = fruits
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }.resume()
    }
}




