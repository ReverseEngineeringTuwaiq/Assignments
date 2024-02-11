
import SwiftUI
import CoreLocation

struct ContentView: View {
    @StateObject private var locationManager = LocationManager()
    @State private var weatherData: WeatherData?
    
    var body: some View {
        ZStack {
            
            LinearGradient(colors: [.blue,.black], startPoint: .topLeading, endPoint: .bottomTrailing)

            VStack {
                Circle().foregroundColor(.white)
                    .opacity(0.1)
                    .frame(width: 300)
                    .overlay {
                    
                    VStack{
                        if let weatherData = weatherData {
                            Text("\(Int(weatherData.temperature))°C")
                                .font(.custom("", size: 70))
                                .padding()
                                .foregroundColor(.white)
                            
                            VStack {
                                Text("\(weatherData.locationName)")
                                    .font(.title2).bold()
                                    .foregroundStyle(.white)
                                Text("\(weatherData.condition)")
                                    .font(.body).bold()
                                    .foregroundColor(.white)
                            }
                            
                        } else {
                            ProgressView()
                        }
                    }
                }
            }
            .onAppear {
                locationManager.requestLocation()
            }
            .onReceive(locationManager.$location) { location in
                guard let location = location else { return }
                fetchWeatherData(for: location)
        }
        }.ignoresSafeArea()
    }
    
    private func fetchWeatherData(for location: CLLocation) {
        let apiKey = "2a8a578aef464c46a038156084214869"
        let urlString = "https://api.openweathermap.org/data/2.5/weather?lat=\(location.coordinate.latitude)&lon=\(location.coordinate.longitude)&units=metric&appid=\(apiKey)"
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else { return }
            
            do {
                let decoder = JSONDecoder()
                let weatherResponse = try decoder.decode(WeatherResponse.self, from: data)
                
                DispatchQueue.main.async {
                    weatherData = WeatherData(locationName: weatherResponse.name, temperature: weatherResponse.main.temp, condition: weatherResponse.weather.first?.description ?? "")
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
