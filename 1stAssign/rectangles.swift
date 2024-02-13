//
//  rectangles.swift
//  swiftAssignment
//
//  Created by Bushra Abuhaimed on 19/07/1445 AH.
//
import SwiftUI

enum Icon {
    case facebook
    case google
    case apple
    
    var iconName: String {
        switch self {
        case .facebook: "fb"
        case .google: "google"
        case .apple: "apple"
        }
    }
}

struct RectangleButton: Identifiable {
    var id: UUID = UUID()
    var imageName: Icon
}

struct rectanglesView: View {
    var rectangles: [RectangleButton] = [RectangleButton(imageName: .facebook),
                                   RectangleButton(imageName: .google),
                                   RectangleButton(imageName: .apple)]

    var body: some View {
        HStack(spacing: 20) {
            ForEach(rectangles, id: \.id) { rectangle in
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(.clear)
                        .strokeBorder(.gray.opacity(0.5))
                        .frame(width: 90, height: 60)
                    Image(rectangle.imageName.iconName)
                        .resizable()
                        .frame(width: 30, height: 30)
                }
            }
        }
    }
}

#Preview {
    rectanglesView()
}
