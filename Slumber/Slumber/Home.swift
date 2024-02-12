import SwiftUI
import AVKit

struct ImageModel: Identifiable {
    var id = UUID()
    var image: String
    var title: String
    var subtitle: String
    var description: String?
    var soundURL: URL
    var duration: String
}

class AudioManager: ObservableObject {
    @Published var player: AVPlayer?
    @Published var isPlaying: Bool = false
    
    func startPlayer(audioURL: URL, isPreview: Bool = false) {
        let playerItem = AVPlayerItem(url: audioURL)
        player = AVPlayer(playerItem: playerItem)
        
        if !isPreview {
            player?.play()
            isPlaying = true
        }
    }
    
    func playPause() {
        if let player = player {
            if player.timeControlStatus == .paused {
                player.play()
                isPlaying = true
            } else {
                player.pause()
                isPlaying = false
            }
        }
    }
    
    func stop() {
        if let player = player {
            player.pause()
            player.seek(to: .zero)
            isPlaying = false
        }
    }
}

struct Home: View {
    @ObservedObject var pl = AudioManager()
    
    @State private var featuredStories: [ImageModel] = [
        ImageModel(image: "NaifHamdan",
                   title: "الملك الناصر",
                   subtitle: "الملك الناصر",
                   description: """
الملك ناصر الدين أبو المعالي محمد بن قلاوون بن عبد الله الصالحي أو الناصر محمد اختصاراً (ولد بالقاهرة في 684 هـ / 1285 - توفي بالقاهرة في 741 هـ / 1341). تاسع سلاطين الدولة المملوكية البحرية
""",
                   soundURL: URL(string: "https://bkuesdhmgljhkzpccnfa.supabase.co/storage/v1/object/public/background%20effects/story3.mp3?t=2024-02-09T15%3A41%3A38.327Z")!,
                   duration: "28"),
        ImageModel(image: "NaifHamdan",
                   title: "Funny",
                   subtitle: "الشايب الطويل",
                   soundURL: URL(string: "https://bkuesdhmgljhkzpccnfa.supabase.co/storage/v1/object/public/background%20effects/story2.mp3?t=2024-02-09T09%3A56%3A06.266Z")!,
                   duration: "10"),
        
        ImageModel(image: "NaifHamdan",
                   title: "History",
                   subtitle: "سرعه البديهه",
                   soundURL: URL(string: "https://bkuesdhmgljhkzpccnfa.supabase.co/storage/v1/object/public/background%20effects/story1.mp3?t=2024-02-09T09%3A54%3A37.896Z")!,
                   duration: "8")
    ]
    
    @State private var trendingCollection: [ImageModel] = [
        ImageModel(image: "alshuqairi",
                   title: "40 أربعون",
                   subtitle: "Ahmed Alshuqairi",
                   description: """
كتاب عن تجربة حياتية عاشها أحمد الشقيري في ‏جزيرة نائية في المحيط الهادي خرج منها بقناعات وتأملات عن الذات البشرية والعلاقة ‏مع الآخرين ومع الله سبحانه وتعالى
""",
                   soundURL: URL(string: "https://bkuesdhmgljhkzpccnfa.supabase.co/storage/v1/object/public/background%20effects/40.mp3?t=2024-02-09T18%3A05%3A48.181Z")!,
                   duration: "15"),
        ImageModel(image: "Ibrahim",
                   title: "Time Management",
                   subtitle: "Ibrahim Alfuki",
                   description: """
يبين لنا مكانة الوقـت وأهميته، ويعرفنا على أسباب مضيعات الوقـت والتعرف على معوقات استغلال الوقـت، معرفة الـوقت المفقود ومدى نسبة الوقـت المستغل ويعطينا فوائد تنظيم الـوقت
""",
                   soundURL: URL(string: "https://bkuesdhmgljhkzpccnfa.supabase.co/storage/v1/object/public/background%20effects/timemanagement.mp3?t=2024-02-09T12%3A21%3A44.022Z")!,
                   duration: "16"),
        ImageModel(image: "Saad",
                   title: "سوره الحاقه",
                   subtitle: "Saad Azwit",
                   description: """
سورة الحاقّة من السور المكيّة التي تحدّثت عن يوم القيامة، وتناولت أمور البعث والجزاء، وتوعّدت الكافرين بالعذاب، وسبب نزول الآيات الآخيرة من سورة الحاقة هو سخريّة كفار قريش من النبي -صلّى الله عليه وسلّم- ووصفهم له بأنّه شاعر وساحر وكاهن
""",
                   soundURL: URL(string: "https://bkuesdhmgljhkzpccnfa.supabase.co/storage/v1/object/public/background%20effects/Alhaqah.mp3?t=2024-02-09T18%3A24%3A22.841Z")!,
                   duration: "8")
    ]
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack() {
                    Image("bg1")
                        .resizable()
                        .frame(maxWidth: .infinity)
                        .frame(height: 400)
                    ZStack {
                        VStack {
                            HStack {
                                Text("Naif Hamdan Collection")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .font(.title2)
                                    .foregroundColor(.gray)
                                Image(systemName: "chevron.right")
                            }
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .topLeading)
                            VStack () {
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack(spacing: 16) {
                                        ForEach(featuredStories) { story in
                                            NavigationLink(destination: StoryDetail(story: story)) {
                                                VStack(alignment: .leading) {
                                                    Image(story.image)
                                                        .resizable()
                                                        .frame(width: 140, height: 140)
                                                        .aspectRatio(contentMode: .fill)
                                                        .clipShape(RoundedRectangle(cornerRadius: 25.0))
                                                    
                                                    Text(story.title)
                                                        .font(.headline)
                                                        .foregroundColor(.white)
                                                        .padding(.leading, 8)
                                                    HStack {
                                                    Text(story.subtitle)
                                                        .font(.subheadline)
                                                        .foregroundColor(.gray)
                                                        .lineLimit(2)
                                                        .padding(.leading, 8)
                                                                    
                                                        Image(systemName: "clock")
                                                            .foregroundColor(.gray)
                                                        Text("\(story.duration)m")
                                                            .foregroundColor(.gray)
                                                    }
                                                    .padding(.trailing)
                                                }
                                                .frame(width: 140)
                                                .background(Color.gray.opacity(0.4))
                                                .cornerRadius(12)
                                            }
                                        }
                                    }
                                    .padding(.horizontal)
                                }
                                .padding(.top, -16)
                            }
                        }
                    }
                    
                    ZStack {
                        Color("AccentColor")
                        
                        VStack {
                            HStack {
                                Text("eBook Audio")
                                    .font(.title2)
                                    .foregroundColor(.gray)
                                Spacer()
                            }
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .topLeading)
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 16) {
                                    ForEach(trendingCollection) { track in
                                        NavigationLink(destination: StoryDetail(story: track)) {
                                            VStack(alignment: .leading) {
                                                Image(track.image)
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fill)

                                                    .frame(width: 280, height: 140)
                                                    .clipShape(RoundedRectangle(cornerRadius: 12))
                                                
                                                Text(track.title)
                                                    .font(.headline)
                                                    .foregroundColor(.white)
                                                    .padding(.leading, 8)
                                                HStack{
                                                Text(track.subtitle)
                                                    .font(.subheadline)
                                                    .foregroundColor(.gray)
                                                    .lineLimit(2)
                                                    .padding(.leading, 8)
                                                    
                                                Spacer()
                                                    
                                                    Image(systemName: "clock")
                                                        .foregroundColor(.gray)
                                                    Text("\(track.duration) min")
                                                        .foregroundColor(.gray)
                                                }
                                                .padding(.trailing)
                                            }
                                            .frame(width: 260)
                                            .background(Color.gray.opacity(0.4))
                                            .cornerRadius(12)
                                        }
                                    }
                                }
                                .padding(.horizontal)
                            }
                            .padding(.top, -8)
                        }
                    }
                }
            }
            .ignoresSafeArea()
            .padding(.top, 0)
            .padding(.bottom, 32)
            .background(Color("AccentColor").ignoresSafeArea())
        }
        .preferredColorScheme(.dark)
    }
}

struct StoryDetail: View {
    let story: ImageModel
    @ObservedObject private var audioManager = AudioManager()
    @State private var isPlaying = false
    
    var body: some View {
        VStack {
            Image(story.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 25.0))
            VStack(alignment: .leading) {
                Text(story.title)
                    .font(.title)
                    .foregroundColor(.black)
                    .padding(.top, 16)
                HStack{
                    Text(story.subtitle)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.top, 8)
                    
                    Spacer()
                    
                    Image(systemName: "clock")
                        .foregroundColor(.gray)
                    Text("\(story.duration)m")
                        .foregroundColor(.gray)

                }
                Text(story.description ?? "")
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .padding(.top, 16)
                
            }
            .padding(.horizontal)
            Spacer()
            
            Button(action: {
                isPlaying.toggle()
                if isPlaying {
                    playSound()
                } else {
                    stopSound()
                }
            }) {
                HStack {
                    Text(isPlaying ? "Stop" : "Play")
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding(.horizontal, 20)
                    Image(systemName: isPlaying ? "stop.circle.fill" : "play.circle.fill")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                }
                .padding(10)
                .background(isPlaying ? Color.red : Color.blue)
                .cornerRadius(15)
            }
            .padding(.bottom, 32)
            
            Spacer()
        }
        .navigationBarTitle(story.title, displayMode: .inline)
    }
    
    func playSound() {
        let url = story.soundURL
        audioManager.startPlayer(audioURL: url)
    }
    
    func stopSound() {
        audioManager.stop()
    }
}








#Preview{
    Home()
}
