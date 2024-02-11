//
//  HomeView.swift
//  EVStationProject
//
//  Created by istabraq on 29/07/1445 AH.
//

import SwiftUI

struct HomeView: View {
    @State var appUser: AppUser
    var body: some View {
        VStack
        {
           Text(appUser.uid)
            Text(appUser.email ?? "No Email")
        }
    }
}

#Preview {
    HomeView(appUser: .init(uid: "1234", email: "example@example.com"))
}
