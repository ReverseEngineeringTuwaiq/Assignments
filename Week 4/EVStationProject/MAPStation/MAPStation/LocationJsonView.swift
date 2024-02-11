import Foundation
import MapKit

struct LocationJson: Identifiable, Decodable {
    let id: Int
    let name: String
    let logo: String // Assuming logo is a String representing a URL
    let address: String
    let coordinates: CLLocationCoordinate2D
    static var locations: [LocationJson] = []
    // Implement the Decodable initializer
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        logo = try container.decode(String.self, forKey: .logo)
        address = try container.decode(String.self, forKey: .address)

        // Decode coordinates from separate latitude and longitude keys
        let latitude = try container.decode(Double.self, forKey: .latitude)
        let longitude = try container.decode(Double.self, forKey: .longitude)
        coordinates = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }

    // Define CodingKeys for mapping between JSON keys and struct properties
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case logo
        case address
        case latitude
        case longitude
    }
}


struct LocationJsonView {
    func fetchData() {
        guard let url = URL(string: "https://uizmwjzebkwygmpvoiyg.supabase.co/rest/v1/Locations?select=*") else {
            print("Invalid URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.addValue("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVpem13anplYmt3eWdtcHZvaXlnIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDcyMDUxODUsImV4cCI6MjAyMjc4MTE4NX0.pnKJnZn0DGPUsldbSjPg-n36RYPP18Jc3CMzxiRq2v8", forHTTPHeaderField: "apikey")
        request.addValue("Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVpem13anplYmt3eWdtcHZvaXlnIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDcyMDUxODUsImV4cCI6MjAyMjc4MTE4NX0.pnKJnZn0DGPUsldbSjPg-n36RYPP18Jc3CMzxiRq2v8", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let locationsResponse = try decoder.decode([LocationJson].self, from: data)
                // Now you have the array of LocationJson objects
                print(locationsResponse)
            } catch {
                print("Error decoding JSON: \(error.localizedDescription)")
            }
        }.resume()
    }
}
extension LocationJson: Equatable {
    static func == (lhs: LocationJson, rhs: LocationJson) -> Bool {
        // Implement your equality comparison logic here
        return lhs.id == rhs.id // Assuming 'id' is a unique identifier for locations
    }
}


//// Call the fetchData function
//let locationJsonView = LocationJsonView()
//locationJsonView.fetchData()
