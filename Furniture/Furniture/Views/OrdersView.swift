//
//  OrdersView.swift
//  Furniture
//
//  Created by Admin on 09/02/2024.
//

import SwiftUI

struct OrdersView: View {
    @StateObject var viewModel: HomeViewModel
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        Button{
            self.presentationMode.wrappedValue.dismiss()
        }label:{
            Image(systemName: "chevron.backward")
                .foregroundStyle(Color.black)
                .font(.title3)
        }
            .navigationBarBackButtonHidden(true)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
        ScrollView{
            
        }
    }
}

#Preview {
    OrdersView(viewModel: HomeViewModel())
}
