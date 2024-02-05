//
//  Profile.swift
//  EV_Charging_App
//
//  Created by istabraq on 22/07/1445 AH.
//

import SwiftUI

struct Profile: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                ProfileHeader()
                ProfileItem(icon: "clock.arrow.circlepath", label: "History")
                ProfileItem(icon: "wallet.pass", label: "Wallet")
                ProfileItem(icon: "bell", label: "Notifications")
                ProfileItem(icon: "envelope.open", label: "Invite Friends")
                ProfileItem(icon: "gearshape", label: "Settings")
                ProfileItem(icon: "questionmark.circle", label: "Help")
                Spacer()
            }
        }
    }
}
struct ProfileHeader: View {
    var body: some View {
        ZStack{
            Color.black.opacity(0.8)
                .ignoresSafeArea(.all)
            VStack{
                HStack{
                    Image("image2")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                    
                    VStack(alignment: .leading) {
                        Text("John Doe")
                            .font(.title)
                            .bold()
                            .foregroundColor(.white)
                        Text("View profile >")
                            .font(.subheadline)
                            .foregroundColor(.cyan)
                    }
                    
                    Spacer()
                }
                .padding(20)
            }
        }
    }
}

struct ProfileItem: View {
    var icon: String
    var label: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .font(.title3)
                .foregroundColor(.black)
                .frame(width: 90)
            Text(label)
                .font(.headline)
            Spacer()
        }.padding()
    }
}


    #Preview {
        Profile()
    }
