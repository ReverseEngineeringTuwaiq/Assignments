//
//  ContentView.swift
//  PrayerTime
//
//  Created by istabraq on 24/07/1445 AH.
//
import SwiftUI

struct ContentView: View {
    @State var address: String = ""
    @State var prayerTimes: [PrayerTimeData]?
    @State var errorMessage: String?
    let prayerTimeService = PrayerTimeService()
    
    func calculateTimeDifferenceForNextPrayer(prayerTimes: [PrayerTimeData]) -> TimeInterval? {
        let currentTime = Date().timeIntervalSince1970
        guard let nextPrayerTime = prayerTimes.first(where: {
            if let timestamp = Double($0.date.timestamp) {
                return timestamp > currentTime
            }
            return false
        }) else {
            return nil
        }
        if let nextPrayerTimestamp = TimeInterval(nextPrayerTime.date.timestamp) {
            let timeDifference = nextPrayerTimestamp - currentTime
            return timeDifference
        } else {
            return nil
        }
    }
    
    var body: some View {
        VStack {
            Text("Prayer Times")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 20)
            
            Text("Today is: \(currentDay())") // Display current day
            Text("\(currentTime())") // Display current time

            
            TextField("Please Enter Your Address", text: $address)
                .padding()

            Button(action: {
                prayerTimeService.fetchPrayerTimes(forAddress: address) { data in
                    DispatchQueue.main.async {
                        if let data = data {
                            do {
                                let response = try JSONDecoder().decode(PrayerTimeResponse.self, from: data)
                                self.prayerTimes = response.data
                                self.errorMessage = nil
                            } catch {
                                self.errorMessage = "Failed to decode data."
                                self.prayerTimes = nil
                            }
                        } else {
                            self.errorMessage = "Failed to fetch prayer times."
                            self.prayerTimes = nil
                        }
                    }
                }
            }) {
                Text("Submit")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(8)
            }
            .padding()
            
            if let prayerTimes = prayerTimes {
                PrayerTimesListView(prayerTimes: prayerTimes, calculateTimeDifferenceForNextPrayer: calculateTimeDifferenceForNextPrayer)
            } else if let errorMessage = errorMessage {
                Text("Error: \(errorMessage)")
                    .foregroundColor(.red)
                    .padding()
            }
            
            Spacer()
        }
        .padding()
    }

 func currentDay() -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "EEEE"
    return dateFormatter.string(from: Date())
}
     func currentTime() -> String {
           let dateFormatter = DateFormatter()
           dateFormatter.dateFormat = "HH:mm:ss"
           return dateFormatter.string(from: Date())
       }
}

struct PrayerTimesListView: View {
    let prayerTimes: [PrayerTimeData]
    let calculateTimeDifferenceForNextPrayer: ([PrayerTimeData]) -> TimeInterval?
    
    var body: some View {
        List(prayerTimes, id: \.date) { prayerTime in
            VStack(alignment: .leading) {
                Text(prayerTime.date.readable)
                    .font(.title3)
                    .bold()
                    .foregroundColor(Color.blue)
                
                PrayerTimeDetailsView(prayerTime: prayerTime,
                                      prayerTimes: prayerTimes,
                                      calculateTimeDifferenceForNextPrayer: calculateTimeDifferenceForNextPrayer)
            }
        }
    }
}



struct PrayerTimeDetailsView: View {
    let prayerTime: PrayerTimeData
    let prayerTimes: [PrayerTimeData]
    let calculateTimeDifferenceForNextPrayer: ([PrayerTimeData]) -> TimeInterval?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            PrayerTimeRow(title: "Fajr", time: prayerTime.timings.Fajr)
            PrayerTimeRow(title: "Dhuhr", time: prayerTime.timings.Dhuhr)
            PrayerTimeRow(title: "Asr", time: prayerTime.timings.Asr)
            PrayerTimeRow(title: "Maghrib", time: prayerTime.timings.Maghrib)
            PrayerTimeRow(title: "Isha", time: prayerTime.timings.Isha)
            
            if let remainingTime = calculateTimeDifferenceForNextPrayer(prayerTimes) {
                Text("Time Until Next Prayer: \(formatTimeInterval(remainingTime))")
                    .foregroundColor(.blue)
                    .font(.subheadline)
            }
        }
    }
}

struct PrayerTimeRow: View {
    var title: String
    var time: String

    var body: some View {
        HStack {
            Text(title)
                .font(.headline)
                .foregroundColor(Color.red)
                .frame(width: 80, alignment: .leading)

            Spacer()

            Text(time)
                .font(.subheadline)
                .foregroundColor(Color.secondary)
        }
    }
}

struct PrayerTimeResponse: Decodable {
    let data: [PrayerTimeData]
}
struct PrayerTimeData: Decodable {
    let timings: Timings
    let date: DateInfo
    let meta: Meta
}

struct Timings: Codable {
    let Fajr, Dhuhr, Asr, Maghrib, Isha: String
}

struct DateInfo: Codable, Hashable{
    let readable, timestamp: String
}

struct Meta: Codable {
    let latitude, longitude: Double
    let timezone: String
    let method: Method
    let latitudeAdjustmentMethod, midnightMode, school: String
    let offset: [String: Int]
}

struct Method: Codable {
    let id: Int
    let name: String
    let params: Params
    let location: Location
}

struct Params: Codable {
    let Fajr, Isha: Int
}

struct Location: Codable {
    let latitude, longitude: Double
}

#Preview {
    ContentView()
}

// Helper function to format time interval
func formatTimeInterval(_ interval: TimeInterval) -> String {
    let formatter = DateComponentsFormatter()
    formatter.unitsStyle = .full
    formatter.allowedUnits = [.hour, .minute]
    
    guard let formattedString = formatter.string(from: interval) else {
        return "Unknown"
    }
    
    return formattedString
}

