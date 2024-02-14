//
//  Item.swift
//  grocery-app
//
//  Created by Bushra Abuhaimed on 09/02/2024.
//

import Foundation

struct Item: Identifiable, Hashable {
    let id = UUID().uuidString
    let category: Category
    let name: String
    let cost: Double
    let imageName: String
    
    var quantity: Int = 0
}

let items: [Item] = [
    // fruites
    Item(category: .fruits, name: "Red apple", cost: 5, imageName: "apple"),
    Item(category: .fruits, name: "Peach", cost: 2, imageName: "peach"),
    Item(category: .fruits, name: "Apricot", cost: 1, imageName: "apricot"),
    Item(category: .fruits, name: "Pear", cost: 150, imageName: "pear"),
    Item(category: .fruits, name: "Cherry", cost: 5, imageName: "cherry"),
    
    // vegetables
    Item(category: .vegetables, name: "Broccoli", cost: 5, imageName: "broccoli"),
    
    // dairy
    Item(category: .dairy, name: "Cheese", cost: 5, imageName: "cheese"),
    Item(category: .dairy, name: "Milk", cost: 5, imageName: "milk"),
    Item(category: .dairy, name: "Yogurt", cost: 5, imageName: "yogurt"),
    
    // meat
    Item(category: .meat, name: "Lamchop", cost: 5, imageName: "lamchop"),
    Item(category: .meat, name: "Salami", cost: 5, imageName: "salami"),
    Item(category: .meat, name: "Sausage", cost: 5, imageName: "sausage"),
    
    // fish
    Item(category: .fish, name: "Crab", cost: 5, imageName: "crab"),
    Item(category: .fish, name: "Salmon", cost: 5, imageName: "salmon"),
    Item(category: .fish, name: "Shrimp", cost: 5, imageName: "shrimp"),
    
    // juices
    Item(category: .juices, name: "Apple Juice", cost: 5, imageName: "appleJuice"),
    Item(category: .juices, name: "Lemon Juice", cost: 5, imageName: "lemonJuice"),
    Item(category: .juices, name: "Strawberry Juice", cost: 5, imageName: "strawberryJuice"),
    
    // chocolate
    Item(category: .chocolate, name: "M&M", cost: 5, imageName: "m&m"),
    Item(category: .chocolate, name: "Maltesers", cost: 5, imageName: "maltesers"),
    Item(category: .chocolate, name: "Nutella", cost: 5, imageName: "nutella"),
    
    // bakery
    Item(category: .bakery, name: "Cookies", cost: 5, imageName: "cookies"),
    Item(category: .bakery, name: "Cupcake", cost: 5, imageName: "cupcake"),
    Item(category: .bakery, name: "Toast", cost: 5, imageName: "toast"),
    
    // coffee
    Item(category: .coffee, name: "American", cost: 5, imageName: "american"),
    Item(category: .coffee, name: "Cappuccino", cost: 5, imageName: "cappuccino"),
    Item(category: .coffee, name: "Espresso", cost: 5, imageName: "espresso"),
    
    // spice
    Item(category: .spice, name: "Cumin", cost: 5, imageName: "cumin"),
    Item(category: .spice, name: "Ginger", cost: 5, imageName: "ginger"),
    Item(category: .spice, name: "Paprika", cost: 5, imageName: "paprika"),
    
    // oils
    Item(category: .oils, name: "Almond", cost: 5, imageName: "almond"),
    Item(category: .oils, name: "Olive Oil", cost: 5, imageName: "oliveOil"),
    Item(category: .oils, name: "Sesame", cost: 5, imageName: "sesame"),
    
    // sweets
    Item(category: .sweets, name: "Gum", cost: 5, imageName: "gum"),
    Item(category: .sweets, name: "Ice Cream", cost: 5, imageName: "iceCream"),
    Item(category: .sweets, name: "Marshmallow", cost: 5, imageName: "marshmallow")
]
