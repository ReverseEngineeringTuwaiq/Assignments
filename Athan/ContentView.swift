import SwiftUI
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private var locationManager = CLLocationManager()

    @Published var currentLocation: CLLocation?

    override init() {
        super.init()
        self.locationManager.delegate = self
    }

    func requestLocation() {
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.requestLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        self.currentLocation = location
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed to get location: \(error.localizedDescription)")
    }
}

struct PrayerTimesView: View {
    @ObservedObject var locationManager = LocationManager()
    @State private var prayerTimes: [String: String] = [:]

    let prayerTimeLabels: [String: String] = [
        "Fajr": "الفجر",
        "Sunrise": "الشروق",
        "Dhuhr": "الظهر",
        "Asr": "العصر",
        "Maghrib": "المغرب",
        "Isha": "العشاء",
        "Midnight": "منتصف الليل",
        "Firstthird": "الثلث الأول",
        "Lastthird": "الثلث الأخير",
        "Imsak": "الامساك",
        "Sunset": "الغروب"
    ]

    let arabicOrder: [String] = [
        "الفجر", "الشروق", "الظهر", "العصر", "المغرب", "العشاء", "منتصف الليل", "الثلث الأخير"
    ]

    var body: some View {
        VStack {
            Text("أوقات الصلاة")
                .font(.title)
                .padding()
            
            if prayerTimes.isEmpty {
                Text("No prayer times available")
                    .foregroundColor(.gray)
                    .padding()
            } else {
                        ForEach(arabicOrder, id: \.self) { arabicTime in
                            if let englishTime = prayerTimeLabels.first(where: { $0.value == arabicTime })?.key,
                               let time = prayerTimes[englishTime] {
                                ZStack{
                                    Rectangle()
                                        .frame(width: 200, height: 70)
                                        .foregroundColor(.brown)
                                        .opacity(0.3)
                                    HStack {
                                        Text(time)
                                            .foregroundColor(.secondary)
                                        Text(arabicTime)
                                            .foregroundColor(.primary)
                                            .padding(.trailing)
                                    }
                                    .padding()
                                    
                                }
                            
                        }
                    }
                }
            }
        
        .onAppear {
            locationManager.requestLocation()
        }
        .onReceive(locationManager.$currentLocation) { location in
            guard let location = location else { return }
            fetchPrayerTimes(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        }
    }
    
    func fetchPrayerTimes(latitude: Double, longitude: Double) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let date = dateFormatter.string(from: Date())
        let method = 4
        let url = URL(string: "https://api.aladhan.com/v1/timings/\(date)?latitude=\(latitude)&longitude=\(longitude)&method=\(method)")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching: \(error)")
                return
            }
            
            guard let data = data else {
                print("No data")
                return
            }
            
            do {
                let response = try JSONDecoder().decode(PrayerTimesResponse.self, from: data)
                
                DispatchQueue.main.async {
                    let prayerTimesData = response.data
                    self.prayerTimes = prayerTimesData.timings
                }
            } catch {
                print("Error decoding: \(error)")
            }
        }.resume()
    }
    
}

struct PrayerTimesResponse: Decodable {
    let data: PrayerTimesData
    let code: Int
    let status: String

    enum CodingKeys: String, CodingKey {
        case code
        case status
        case data
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        code = try container.decode(Int.self, forKey: .code)
        status = try container.decode(String.self, forKey: .status)
        data = try container.decode(PrayerTimesData.self, forKey: .data)
    }
}

struct PrayerTimesData: Decodable {
    let timings: [String: String]
}

struct PrayerTimesView_Previews: PreviewProvider {
    static var previews: some View {
        PrayerTimesView()
    }
}
