//
//  Note.swift
//  Notes
//
//  Created by Bushra Abuhaimed on 23/07/1445 AH.
//

import Foundation

struct Note: Identifiable, Codable {
    var id = UUID()
    var fileName: String
    var text: String
}
