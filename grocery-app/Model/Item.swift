//
//  Item.swift
//  grocery-app
//
//  Created by vdotup on 09/02/2024.
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
    Item(category: .fruits, name: "Red apple", cost: 150, imageName: "apple"),
    Item(category: .fruits, name: "Peach", cost: 120, imageName: "peach"),
    Item(category: .fruits, name: "Apricot", cost: 100, imageName: "apricot"),
    Item(category: .fruits, name: "Pear", cost: 150, imageName: "pear"),
    Item(category: .fruits, name: "Cherry", cost: 150, imageName: "cherry"),
    
    // vegetables
    Item(category: .vegetables, name: "Broccoli", cost: 150, imageName: "broccoli"),
    
    // dairy
    Item(category: .dairy, name: "Cheese", cost: 150, imageName: "cheese"),
    Item(category: .dairy, name: "Milk", cost: 150, imageName: "milk"),
    Item(category: .dairy, name: "Yogurt", cost: 150, imageName: "yogurt"),
    
    // meat
    Item(category: .meat, name: "Lamchop", cost: 150, imageName: "lamchop"),
    Item(category: .meat, name: "Salami", cost: 150, imageName: "salami"),
    Item(category: .meat, name: "Sausage", cost: 150, imageName: "sausage"),
    
    // fish
    Item(category: .fish, name: "Crab", cost: 150, imageName: "crab"),
    Item(category: .fish, name: "Salmon", cost: 150, imageName: "salmon"),
    Item(category: .fish, name: "Shrimp", cost: 150, imageName: "shrimp"),
    
    // juices
    Item(category: .juices, name: "Apple Juice", cost: 150, imageName: "appleJuice"),
    Item(category: .juices, name: "Lemon Juice", cost: 150, imageName: "lemonJuice"),
    Item(category: .juices, name: "Strawberry Juice", cost: 150, imageName: "strawberryJuice"),
    
    // chocolate
    Item(category: .chocolate, name: "M&M", cost: 150, imageName: "m&m"),
    Item(category: .chocolate, name: "Maltesers", cost: 150, imageName: "maltesers"),
    Item(category: .chocolate, name: "Nutella", cost: 150, imageName: "nutella"),
    
    // bakery
    Item(category: .bakery, name: "Cookies", cost: 150, imageName: "cookies"),
    Item(category: .bakery, name: "Cupcake", cost: 150, imageName: "cupcake"),
    Item(category: .bakery, name: "Toast", cost: 150, imageName: "toast"),
    
    // coffee
    Item(category: .coffee, name: "American", cost: 150, imageName: "american"),
    Item(category: .coffee, name: "Cappuccino", cost: 150, imageName: "cappuccino"),
    Item(category: .coffee, name: "Espresso", cost: 150, imageName: "espresso"),
    
    // spice
    Item(category: .spice, name: "Cumin", cost: 150, imageName: "cumin"),
    Item(category: .spice, name: "Ginger", cost: 150, imageName: "ginger"),
    Item(category: .spice, name: "Paprika", cost: 150, imageName: "paprika"),
    
    // oils
    Item(category: .oils, name: "Almond", cost: 150, imageName: "almond"),
    Item(category: .oils, name: "Olive Oil", cost: 150, imageName: "oliveOil"),
    Item(category: .oils, name: "Sesame", cost: 150, imageName: "sesame"),
    
    // sweets
    Item(category: .sweets, name: "Gum", cost: 150, imageName: "gum"),
    Item(category: .sweets, name: "Ice Cream", cost: 150, imageName: "iceCream"),
    Item(category: .sweets, name: "Marshmallow", cost: 150, imageName: "marshmallow")
]
