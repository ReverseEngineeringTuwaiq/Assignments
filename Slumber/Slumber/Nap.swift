import SwiftUI
import AVKit

struct ANap: View {
    @State private var selectedDurationIndex = 0
    @State private var isTimerRunning = false
    @State private var remainingSeconds = 0
    @State private var backgroundPlayer: AVPlayer?
    @State private var alarmPlayer: AVPlayer?
    @State private var selectedEffectIndex = 0
    @State private var isAlarmPlaying = false
    
    let timerDurations = Array(0...60)
    @State private var timer: Timer?
    
    let backgroundEffects: [BackgroundEffect] = [
        BackgroundEffect(name: "Rain", soundURL: URL(string: "https://bkuesdhmgljhkzpccnfa.supabase.co/storage/v1/object/public/background%20effects/rain.mp3?t=2024-02-07T16%3A02%3A00.911Z")!),
        BackgroundEffect(name: "Ocean", soundURL: URL(string: "https://bkuesdhmgljhkzpccnfa.supabase.co/storage/v1/object/public/background%20effects/ocean.mp3?t=2024-02-07T16%3A02%3A19.035Z")!),
        BackgroundEffect(name: "Campfire", soundURL: URL(string: "https://bkuesdhmgljhkzpccnfa.supabase.co/storage/v1/object/public/background%20effects/fire.mp3?t=2024-02-07T16%3A02%3A28.251Z")!),
        BackgroundEffect(name: "Birds", soundURL: URL(string: "https://bkuesdhmgljhkzpccnfa.supabase.co/storage/v1/object/public/background%20effects/birds.mp3")!),
        BackgroundEffect(name: "Train", soundURL: URL(string: "https://bkuesdhmgljhkzpccnfa.supabase.co/storage/v1/object/public/background%20effects/train.mp3")!),
        BackgroundEffect(name: "Cricket", soundURL: URL(string: "https://bkuesdhmgljhkzpccnfa.supabase.co/storage/v1/object/public/background%20effects/cricket.mp3?t=2024-02-07T16%3A02%3A56.717Z")!),
        BackgroundEffect(name: "مكيف شباك", soundURL: URL(string: "https://bkuesdhmgljhkzpccnfa.supabase.co/storage/v1/object/public/background%20effects/shbak1.mp3")!)
    ]
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.6)
                .ignoresSafeArea()
            
            VStack {
                if isTimerRunning {
                    ZStack {
                        Circle()
                            .stroke(Color.orange, lineWidth: 5)
                            .frame(width: 200, height: 200)
                        Text("\(remainingSeconds)")
                            .font(.system(size: 100))
                            .foregroundColor(.white)
                    }
                    .padding()
                }
                
                Picker(selection: $selectedDurationIndex, label: Text("Select Duration")) {
                    ForEach(timerDurations, id: \.self) { duration in
                        Text("\(duration) seconds")
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .frame(width: 200)
                .padding()
                
                ScrollView(.horizontal) {
                    HStack(spacing: 10) {
                        ForEach(backgroundEffects.indices, id: \.self) { index in
                            Button(action: {
                                selectedEffectIndex = index
                            }) {
                                VStack {
                                    Text(backgroundEffects[index].name)
                                        .font(.subheadline)
                                        .foregroundColor(.primary)
                                        .multilineTextAlignment(.center)
                                        .padding(10)
                                        .background(Color.secondary.opacity(0.1))
                                        .cornerRadius(10)
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                }

                
                Button(action: {
                    isTimerRunning.toggle()
                    if isTimerRunning {
                        startTimer()
                    } else {
                        stopTimer()
                    }
                }) {
                    Text(isTimerRunning ? "Stop Timer" : "Start Timer")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding()
                
                if isAlarmPlaying {
                    Button(action: {
                        stopAlarm()
                    }) {
                        Text("Stop Alarm")
                            .padding()
                            .background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .padding()
                }
            }
        }
        .onAppear {
            loadAlarmPlayer()
        }
    }
    
    private func startTimer() {
        backgroundPlayer?.pause()
        remainingSeconds = timerDurations[selectedDurationIndex]
        
        let effect = backgroundEffects[selectedEffectIndex]
        backgroundPlayer = AVPlayer(url: effect.soundURL)
        backgroundPlayer?.volume = 0.5
        backgroundPlayer?.play()
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if remainingSeconds > 0 {
                remainingSeconds -= 1
            } else {
                stopTimer()
                playAlarm()
            }
        }
    }
    
    private func stopTimer() {
        timer?.invalidate()
        timer = nil
        isTimerRunning = false
        backgroundPlayer?.pause()
    }
    
    private func loadAlarmPlayer() {
        if let url = URL(string: "https://bkuesdhmgljhkzpccnfa.supabase.co/storage/v1/object/public/background%20effects/alarm.mp3?t=2024-02-09T10%3A21%3A33.500Z") {
            alarmPlayer = AVPlayer(url: url)
            alarmPlayer?.volume = 0.5
        }
    }
    
    private func playAlarm() {
        alarmPlayer?.play()
        isAlarmPlaying = true
        print("Alarm played")
    }
    
    private func stopAlarm() {
        alarmPlayer?.pause()
        isAlarmPlaying = false
        print("Alarm stopped")
    }
}

#Preview{
    ANap()
}
