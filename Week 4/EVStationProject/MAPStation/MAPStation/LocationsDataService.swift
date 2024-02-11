//
//  LocationsDataService.swift
//  MAPStation
//
//  Created by istabraq on 27/07/1445 AH.
//

import Foundation
import MapKit
import SwiftUI

class LocationsDataService {
    
    static let locations: [Location] = [
        Location(
            name: "SASCO",
            cityName: "EV Charging Station",
            coordinates: CLLocationCoordinate2D(latitude: 24.97110, longitude: 46.68627),
            descripition: "VMQW+9H8, King Khalid International Airport, Riyadh 13418",
            imageName: [
                "SASCO"
            ],
            plugs: [
                "ev.plug.dc.ccs1.fill",
                "ev.plug.dc.chademo.fill"
            
            ],
            link: "https://en.wikipedia.org/wiki/Colosseum"),
        Location(
            name: "GreenParking ",
            cityName: "EV Charging Station",
            coordinates: CLLocationCoordinate2D(latitude: 24.75679, longitude: 46.61486),
            descripition: "MJFF+H68, Al Safarat, Riyadh 12511",
            imageName: [
                "Greenparking"
            ],
            plugs: [
                "ev.plug.dc.ccs1.fill",
                "ev.plug.dc.chademo.fill"
            
            ],
            link: "https://en.wikipedia.org/wiki/Pantheon,_Rome"),
        Location(
            name: "Caroosh",
            cityName: "EV Charging Station",
            coordinates: CLLocationCoordinate2D(latitude: 24.87147, longitude: 46.60936),
            descripition: "3555 Wadi Al Ain, Hittin, Riyadh 13516",
            imageName: [
                "caroosh"
            ],
            plugs: [
                "ev.plug.dc.ccs1.fill",
                "ev.plug.dc.chademo.fill"
            
            ],
            link: "https://en.wikipedia.org/wiki/Trevi_Fountain"),
        Location(
            name: "EVIQ",
            cityName: "EV Charging Station",
            coordinates: CLLocationCoordinate2D(latitude: 24.94122, longitude: 46.73021),
            descripition: "RPRM+Q3V, King Khalid International Airport, Riyadh 13413",
            imageName: [
                "EVIQ"
            ],
            plugs: [
                "ev.plug.dc.ccs1.fill",
                "ev.plug.dc.chademo.fill"
            
            ],
            link: "https://en.wikipedia.org/wiki/Eiffel_Tower"),
        Location(
            name: "أشحن",
            cityName: "EV Charging Station",
            coordinates: CLLocationCoordinate2D(latitude: 24.90137, longitude: 46.67528),
            descripition: "Mohammed bin Salman Rd, Ar Rabi, Riyadh 13316",
            imageName: [
                "ESH7AN"
            ],
            plugs: [
                "ev.plug.dc.ccs1.fill",
                "ev.plug.dc.chademo.fill"
            ],
            link: "https://en.wikipedia.org/wiki/Louvre"),
    ]
    
}
