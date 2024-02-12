import SwiftUI
import UserNotifications

struct ProfileView: View {
    @State private var isReminderEnabled = false
    @State private var bedtimeHour = Calendar.current.component(.hour, from: Date())
    @State private var bedtimeMinute = Calendar.current.component(.minute, from: Date())
    @State private var isBedtimeSet = false
    @State private var selectedIconIndex = 0
    let appIcons = ["icon1", "icon2"] 
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black.opacity(0.7).edgesIgnoringSafeArea(.all)
                
                VStack {
                    Toggle("Bedtime Reminder", isOn: $isReminderEnabled)
                        .padding()
                    
                    if isReminderEnabled {
                        HStack {
                            Text("Bedtime:")
                            Picker("Hour", selection: $bedtimeHour) {
                                ForEach(0..<24) { hour in
                                    Text("\(hour)")
                                }
                            }
                            .pickerStyle(WheelPickerStyle())
                            .frame(width: 50)
                            
                            Text(":")
                            
                            Picker("Minute", selection: $bedtimeMinute) {
                                ForEach(0..<60) { minute in
                                    Text("\(minute)")
                                }
                            }
                            .pickerStyle(WheelPickerStyle())
                            .frame(width: 50)
                            
                            Button(action: {
                                isBedtimeSet.toggle()
                                if isBedtimeSet {
                                    scheduleBedtimeReminder()
                                } else {
                                    cancelNotifications()
                                }
                            }) {
                                Text(isBedtimeSet ? "Cancel Bedtime" : "Set Bedtime")
                                    .padding(.vertical, 8)
                                    .padding(.horizontal, 12)
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .cornerRadius(8)
                            }
                            .padding(.leading, 10)
                        }
                        .padding()
                    }
                    
                    Spacer()
                    
                    NavigationLink(destination: IconSelectionView(selectedIconIndex: $selectedIconIndex, appIcons: appIcons)) {
                        Text("App Icon Selection")
                            .padding(.vertical, 8)
                            .padding(.horizontal, 12)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                            .padding()
                    }
                }
            }
            .onChange(of: isReminderEnabled) { newValue in
                if !newValue {
                    cancelNotifications()
                    isBedtimeSet = false
                }
            }
            .onAppear {
                requestNotificationAuthorization()
            }
            .navigationTitle("Profile")
        }
    }
    
    private func requestNotificationAuthorization() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { granted, error in
            if let error = error {
                print("Error requesting authorization: \(error.localizedDescription)")
            }
        }
    }
    
    private func cancelNotifications() {
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["BedtimeReminder"])
    }
    
    private func scheduleBedtimeReminder() {
        let content = UNMutableNotificationContent()
        content.title = "وقت النوم!"
        content.body = "حان موعد النوم الآن 😴"
        content.sound = UNNotificationSound.default
        
        var dateComponents = DateComponents()
        dateComponents.hour = bedtimeHour
        dateComponents.minute = bedtimeMinute
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        let request = UNNotificationRequest(identifier: "BedtimeReminder", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error scheduling notification: \(error.localizedDescription)")
            }
        }
    }
}

struct IconSelectionView: View {
    @Binding var selectedIconIndex: Int
    let appIcons: [String]
    
    var body: some View {
        VStack {
            Text("Select App Icon:")
                .font(.title)
                .padding()
            
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
                    ForEach(0..<appIcons.count, id: \.self) { index in
                        Button(action: {
                            selectedIconIndex = index
                            changeAppIcon(to: appIcons[index])
                        }) {
                            Image(appIcons[index])
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50)
                        }
                        .buttonStyle(BorderlessButtonStyle())
                    }
                }
                .padding()
            }
        }
    }
    
    private func changeAppIcon(to iconName: String) {
        UIApplication.shared.setAlternateIconName(iconName) { error in
            if let error = error {
                print("Error changing app icon: \(error.localizedDescription)")
            } else {
                print("App icon changed successfully to \(iconName)")
            }
        }
    }
}


#Preview{
    ProfileView()
}
