//
//  ListView.swift
//  grocery-app
//
//  Created by vdotup on 09/02/2024.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject private var listVM: ListViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            
            Text("Shopping list")
                .font(.headline)
                .padding(.horizontal, 16)
            
            ScrollView {
                VStack {
                    ForEach(listVM.listItems) { item in
                        ItemView(item: item)
                    }
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 4)
            }
        }
    }
}

#Preview {
    ListView()
        .environmentObject(ListViewModel())
}
