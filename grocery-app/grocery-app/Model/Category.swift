//
//  Category.swift
//  grocery-app
//
//  Created by Bushra Abuhaimed on 09/02/2024.
//

import SwiftUI

enum Category: String, CaseIterable {
    case fruits = "Fruits"
    case vegetables = "Vegetables"
    case dairy = "Dairy"
    case meat = "Meat"
    case fish = "Fish"
    case juices = "Juices"
    case chocolate = "Chocolate"
    case bakery = "Bakery"
    case coffee = "Coffee"
    case spice = "Spice"
    case oils = "Oils"
    case sweets = "Sweets"
    
    var imageName: String { "\(self)" }
    
    var color: Color {
        switch self {
        case .fruits: return Color(red: 254/255, green: 226/255, blue: 255/255)
        case .vegetables: return Color(red: 229/255, green: 252/255, blue: 227/255)
        case .dairy: return Color(red: 255/255, green: 255/255, blue: 226/255)
        case .meat: return Color(red: 255/255, green: 238/255, blue: 234/255)
        case .fish: return Color(red: 217/255, green: 238/255, blue: 255/255)
        case .juices: return Color(red: 255/255, green: 233/255, blue: 155/255)
        case .chocolate: return Color(red: 226/255, green: 191/255, blue: 173/255)
        case .bakery: return Color(red: 255/255, green: 225/255, blue: 197/255)
        case .coffee: return Color(red: 196/255, green: 176/255, blue: 157/255)
        case .spice: return Color(red: 255/255, green: 175/255, blue: 171/255)
        case .oils: return Color(red: 225/255, green: 209/255, blue: 139/255)
        case .sweets: return Color(red: 254/255, green: 220/255, blue: 182/255)
        }
    }
}
