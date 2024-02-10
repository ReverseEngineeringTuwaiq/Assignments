//
//  ListViewModel.swift
//  grocery-app
//
//  Created by vdotup on 10/02/2024.
//

import Foundation

class ListViewModel: ObservableObject {
    
    @Published var listItems: [Item] = []
    
}
