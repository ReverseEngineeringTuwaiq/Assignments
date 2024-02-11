import Foundation


struct Stock: Decodable, Hashable, Identifiable{
    var id: Int
    var category: String
    var desc: String
    var price: String
    var image: String
}


final class HomeViewModel: ObservableObject{
    @Published var stock: [Stock] = []
    @Published var likedItems: [Stock] = []
    @Published var cartItems: [Stock] = []
    
    func loadStock(){
        var request = URLRequest(url: URL(string: "https://zrpvrhzeutmirzwxybng.supabase.co/rest/v1/Furniture?select=*")!,timeoutInterval: Double.infinity)
        request.addValue("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InpycHZyaHpldXRtaXJ6d3h5Ym5nIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDcyODg1MzEsImV4cCI6MjAyMjg2NDUzMX0.515IPdVS011qjrql85X3gLZ30Pvj76fuU1r8Btj3FKA", forHTTPHeaderField: "apikey")
//        request.addValue("Bearer eyJhbGciOiJIUzI1NiIsImtpZCI6InJnYXM0Snd6V0JyOU1tWXYiLCJ0eXAiOiJKV1QifQ.eyJhdWQiOiJhdXRoZW50aWNhdGVkIiwiZXhwIjoxNzA3MzM3Mzg5LCJpYXQiOjE3MDczMzM3ODksImlzcyI6Imh0dHBzOi8venJwdnJoemV1dG1pcnp3eHlibmcuc3VwYWJhc2UuY28vYXV0aC92MSIsInN1YiI6ImU2OTRlZjYzLTU1ZDMtNDExMS1iZTBhLTRlNWJlYzRiZDJmZiIsImVtYWlsIjoiZnVybml0dXJlQDEzMzdkZXZpbC5tZSIsInBob25lIjoiIiwiYXBwX21ldGFkYXRhIjp7InByb3ZpZGVyIjoiZW1haWwiLCJwcm92aWRlcnMiOlsiZW1haWwiXX0sInVzZXJfbWV0YWRhdGEiOnt9LCJyb2xlIjoiYXV0aGVudGljYXRlZCIsImFhbCI6ImFhbDEiLCJhbXIiOlt7Im1ldGhvZCI6InBhc3N3b3JkIiwidGltZXN0YW1wIjoxNzA3MzMzNzg5fV0sInNlc3Npb25faWQiOiI3ODY0MzVhMS00MjMxLTRkOGItOTM1OC1mMDBjNTJlNmUxNTcifQ.4JZxf27I6ScYAXFzy32lYKekCQPTLRtFn4jwTKLZsEs", forHTTPHeaderField: "Authorization")

        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            return
          }
          print(String(data: data, encoding: .utf8)!)
            do{
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode([Stock].self, from: data)
                DispatchQueue.main.async{
                    self.stock = decodedData
                }
                
            }catch{
                print("Error JWT Token must've expired")
            }
        }

        task.resume()
    }
    
    func toggleLike(for item: Stock) {
        if likedItems.contains(where: {$0.id == item.id}) {
            likedItems.removeAll(where: {$0.id == item.id})
           } else {
               likedItems.append(item)
           }
       }
    
    func addToCart(for item: Stock) {
        if cartItems.contains(where: {$0.id == item.id}) {
            cartItems.removeAll(where: {$0.id == item.id})
           } else {
               cartItems.append(item)
           }
       }
    
    func iconName(for category: String) -> String {
        switch category {
        case "Sofas":
            return "sofa"
        case "TV Unit":
            return "tv"
        case "Chair":
            return "chair"
        case "Beds":
            return "bed.double"
        case "Table":
            return "table.furniture"
        case "Home":
            return "house"
        case "Categories":
            return "square.grid.2x2"
        case "Favorites":
            return "heart"
        case "Profile":
            return "person"
        case "Orders":
            return "truck.box.badge.clock"
        default:
            return "questionmark"
        }
    }
}
