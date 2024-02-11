//
//  Locations.swift
//  MAPStation
//
//  Created by istabraq on 27/07/1445 AH.
//

import Foundation
import MapKit

struct Location: Identifiable, Equatable {
    let id = UUID().uuidString
    let name: String
    let cityName: String
    let coordinates: CLLocationCoordinate2D
    let descripition: String
    let imageName: [String]
    let plugs: [String]
    let link: String
    
    static func == (lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
}
