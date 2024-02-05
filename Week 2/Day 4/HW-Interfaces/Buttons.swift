//
//  Buttons.swift
//  HW-Interfaces
//
//  Created by istabraq on 20/07/1445 AH.
//

import SwiftUI

struct Buttons: View {
    var body: some View {
        HStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    Button1
                    Button2
                    Button3
                    Button4
                }
            }
        }
    }
    var Button1: some View {
        Button(action: {}) {
            Text("✅ All")
                .font(.callout)
                .foregroundColor(.white)
                .frame(width: 48, height: 8)
                .bold()
                .padding()
                .background(Color.blue)
                .cornerRadius(20)
        }
        
    }
    var Button2: some View {
        Button(action: {}) {
            Text("🏡 House")
                .font(.callout)
                .foregroundColor(.blue)
                .padding(.vertical, 4)
                .padding(.horizontal, 12)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.blue, lineWidth: 2))
        }
        
    }
    var Button3: some View {
        Button(action: {}) {
            Text("🏠 Villa")
                .font(.callout)
                .foregroundColor(.blue)
                .padding(.vertical, 4)
                .padding(.horizontal, 12)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.blue, lineWidth: 2))
        }
    }
    var Button4: some View {
        Button(action: {}) {
            Text("🏢 Apartment")
                .font(.callout)
                .foregroundColor(.blue)
                .padding(.vertical, 4)
                .padding(.horizontal, 12)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.blue, lineWidth: 2))
        }
    }
}

#Preview {
    Buttons()
}
