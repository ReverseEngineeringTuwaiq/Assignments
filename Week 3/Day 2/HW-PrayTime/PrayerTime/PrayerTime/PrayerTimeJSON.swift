//
//  PrayerTimeJSON.swift
//  PrayerTime
//
//  Created by istabraq on 25/07/1445 AH.
//

import Foundation

class PrayerTimeService {
    let jsonString = """
        {
            "data": [
                {
                    "timings": {
                        "Fajr": "04:41 (+03)",
                        "Sunrise": "05:44 (+03)",
                        "Dhuhr": "11:57 (+03)",
                        "Asr": "15:24 (+03)",
                        "Sunset": "18:09 (+03)",
                        "Maghrib": "18:09 (+03)",
                        "Isha": "19:12 (+03)",
                        "Imsak": "04:31 (+03)",
                        "Midnight": "23:57 (+03)",
                        "Firstthird": "22:01 (+03)",
                        "Lastthird": "01:53 (+03)"
                    },
                    "date": {
                        "readable": "01 Apr 2024",
                        "timestamp": "1711951261",
                        "gregorian": {
                            "date": "01-04-2024",
                            "format": "DD-MM-YYYY",
                            "day": "01",
                            "weekday": {
                                "en": "Monday"
                            },
                            "month": {
                                "number": 4,
                                "en": "April"
                            },
                            "year": "2024",
                            "designation": {
                                "abbreviated": "AD",
                                "expanded": "Anno Domini"
                            }
                        },
                        "hijri": {
                            "date": "22-09-1445",
                            "format": "DD-MM-YYYY",
                            "day": "22",
                            "weekday": {
                                "en": "Al Athnayn",
                                "ar": "الاثنين"
                            },
                            "month": {
                                "number": 9,
                                "en": "Ramaḍān",
                                "ar": "رَمَضان"
                            },
                            "year": "1445",
                            "designation": {
                                "abbreviated": "AH",
                                "expanded": "Anno Hegirae"
                            },
                            "holidays": []
                        }
                    },
                    "meta": {
                        "latitude": 24.664126,
                        "longitude": 46.814232,
                        "timezone": "Asia/Riyadh",
                        "method": {
                            "id": 2,
                            "name": "Islamic Society of North America (ISNA)",
                            "params": {
                                "Fajr": 15,
                                "Isha": 15
                            },
                            "location": {
                                "latitude": 39.70421229999999,
                                "longitude": -86.39943869999999
                            }
                        },
                        "latitudeAdjustmentMethod": "ANGLE_BASED",
                        "midnightMode": "STANDARD",
                        "school": "STANDARD",
                        "offset": {
                            "Imsak": 0,
                            "Fajr": 0,
                            "Sunrise": 0,
                            "Dhuhr": 0,
                            "Asr": 0,
                            "Maghrib": 0,
                            "Sunset": 0,
                            "Isha": 0,
                            "Midnight": 0
                        }
                    }
                }
            ]
        }
        """


    func decodeJSONString() {
        // Decode the JSON data
        if let jsonData = jsonString.data(using: .utf8) {
            do {
                let prayerTimeResponse = try JSONDecoder().decode(PrayerTimeResponse.self, from: jsonData)
                print("Number of data items: \(prayerTimeResponse.data.count)")
            } catch {
                print("Error decoding JSON: \(error)")
            }
        } else {
            print("Failed to convert JSON string to data.")
        }
    }


    func fetchPrayerTimes(forAddress address: String, completion: @escaping (Data?) -> Void) {
        let AdhanURL = "http://api.aladhan.com/v1/calendarByAddress/2024/2?address=\(address)&method=2"
        guard let url = URL(string: AdhanURL) else {
            completion(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error)")
                completion(nil)
                return
            }
            
            completion(data)
        }
        task.resume()
    }
}

