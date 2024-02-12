import SwiftUI
import AVKit

struct BackgroundEffect: Identifiable {
    var id = UUID()
    var name: String
    var soundURL: URL
    var player: AVPlayer?
    var volume: Float = 0
}


struct SoundEffect: View {
    @State private var selectedTab: Int = 1

    @State private var backgroundEffects: [BackgroundEffect] = [
        BackgroundEffect(name: "Rain", soundURL: URL(string: "https://bkuesdhmgljhkzpccnfa.supabase.co/storage/v1/object/public/background%20effects/rain.mp3?t=2024-02-07T16%3A02%3A00.911Z")!),
        BackgroundEffect(name: "Ocean", soundURL: URL(string: "https://bkuesdhmgljhkzpccnfa.supabase.co/storage/v1/object/public/background%20effects/ocean.mp3?t=2024-02-07T16%3A02%3A19.035Z")!),
        BackgroundEffect(name: "Campfire", soundURL: URL(string: "https://bkuesdhmgljhkzpccnfa.supabase.co/storage/v1/object/public/background%20effects/fire.mp3?t=2024-02-07T16%3A02%3A28.251Z")!),
        BackgroundEffect(name: "Birds", soundURL: URL(string: "https://bkuesdhmgljhkzpccnfa.supabase.co/storage/v1/object/public/background%20effects/birds.mp3")!),
        BackgroundEffect(name: "Train", soundURL: URL(string: "https://bkuesdhmgljhkzpccnfa.supabase.co/storage/v1/object/public/background%20effects/train.mp3")!),
        BackgroundEffect(name: "Cricket", soundURL: URL(string: "https://bkuesdhmgljhkzpccnfa.supabase.co/storage/v1/object/public/background%20effects/cricket.mp3?t=2024-02-07T16%3A02%3A56.717Z")!),
        BackgroundEffect(name: "مكيف شباك", soundURL: URL(string: "https://bkuesdhmgljhkzpccnfa.supabase.co/storage/v1/object/public/background%20effects/shbak1.mp3")!)
    ]
    
    var body: some View {
        VStack {
            List(backgroundEffects.indices, id: \.self) { x in
                var effect = backgroundEffects[x]
                HStack {
                    Text(effect.name)
                    Spacer()
                    Slider(value: Binding(
                        get: {
                            effect.volume
                        },
                        set: { newValue in
                            effect.volume = newValue
                            effect.player?.volume = newValue
                        }
                    ), in: 0...1)
                }
            }
            .onAppear {
                for x in backgroundEffects.indices {
                    let effect = backgroundEffects[x]
                    let player = AVPlayer(url: effect.soundURL)
                    player.volume = effect.volume
                    player.play()
                    backgroundEffects[x].player = player
                }
            }
        }
        
        .preferredColorScheme(.dark)
            
                }
    
    }


#Preview{
    SoundEffect()
}
