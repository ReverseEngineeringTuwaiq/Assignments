import SwiftUI

struct ContactInfoView: View {
    var name: String
    var phone: String
    var email: String
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.2)
                .ignoresSafeArea()
            VStack{
                Circle()
                    .fill(Color.gray)
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                    .opacity(0.6)
                    .overlay {
                        Text(String(name.first ?? Character("A")))
                            .font(.largeTitle)
                    }
                Text(name).font(.largeTitle)
                HStack{
                    CallView(image: "message.fill", text: "message")
                    CallView(image: "phone.fill", text: "call")
                    CallView(image: "video.fill", text: "video")
                    CallView(image: "envelope.fill", text: "mail")
                }.padding(.bottom, 5)
                UserInfoView(text: "mobile", info: phone)
                UserInfoView(text: "email", info: email)
                
                Spacer()
            }.padding()
        }
    }
}

struct CallView: View{
    var image: String
    var text: String
    
    var body: some View{
        RoundedRectangle(cornerRadius: 8)
            .fill(Color.white)
            .frame(width: 90, height: 50)
            .overlay {
                VStack(spacing: 2){
                    Image(systemName: image)
                        .foregroundStyle(Color.blue)
                    Text(text)
                        .font(.footnote)
                        .foregroundStyle(Color.blue)
                }
                
            }
    }
}

struct UserInfoView: View {
    var text: String
    var info: String
    
    var body: some View {
        VStack{
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.white)
                .frame(width: 380, height: 60)
                .overlay {
                    VStack {
                        Text(text)
                        Text(info)
                            .foregroundStyle(Color.blue)
                    }
                    
                }
        }
    }
}

#Preview {
    ContactInfoView(name: "Muhannad", phone: "0535778209", email: "swift@swift.com")
}
