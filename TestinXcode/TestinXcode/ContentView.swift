//
//  ContentView.swift
//  TestinXcode
//
//  Created by Osama on 17/07/1445 AH.
//
import SwiftUI
struct ContentView: View {
  var body: some View {
            ZStack {
                VStack{
                    Text("Welcome to the iTonse Store")
                        .font(.largeTitle)
                        .bold()
                        .multilineTextAlignment(.center)
                        .padding()
                    HStack{
                        Image(systemName:"music.note")
                            .resizable()
                            .frame(width:50, height:50)
                            .imageScale(.medium)
                            .foregroundStyle(.blue)
                            .cornerRadius(8)
                        VStack{
                            Text("Get the Music you want")
                                .font(.title2)
                                .bold()
                                .padding(.horizontal)
                            //backgroundStyle(Color.gray)
                            Text("buy your favorite songs & albums.")
                                .padding(.leading)
                                .foregroundStyle(.gray)
                        } .padding()
                        }
                    HStack{
                        Image(systemName: "film")
                            .resizable()
                            .frame(width:50, height:50)
                            .imageScale(.medium)
                            .foregroundStyle(.blue)
                            .cornerRadius(8)
                        VStack{
                            Text("Watch the latest movies")
                                .font(.title2)
                                .bold()
                                .padding(.horizontal)
                            //backgroundStyle(Color.gray)
                            Text("buy or rent your favorite movies.")
                                .foregroundStyle(.gray)
                        } .padding()
                        }
                    HStack {
                        Image(systemName: "pc")
                            .resizable()
                            .frame(width:50, height:50)
                            .imageScale(.medium)
                            .foregroundStyle(.blue)
                            .cornerRadius(8)
                        VStack{
                            Text("Enjoy Ad-free TV shows")
                                .font(.title2)
                                .bold()
                                .padding(.horizontal)
                            //backgroundStyle(Color.gray)
                            Text("buy individual episodes or entire seassons in HD & commircial-free.")
                                .padding(.leading)
                                .foregroundStyle(.gray)
                        } .padding()
                        }
                    VStack{
                        Image(systemName: "person.fill")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.blue)
                            .padding(8)
                        VStack{
                            Text("kbedcuh oiahohd uhec oihad yfs poheoh ioheqwdjkjk bpioheh uheijnd piowdjnan oidjnascnxlinacjjkdkjl onacsjlqwodijkinfsd oinfsdeojesw oiefioefnijksdhncdschkolj")
                                .padding(.leading)
                            //.font()
                                .foregroundColor(.gray)
                                .font(.caption)
                                .multilineTextAlignment(.center)
                            
                            Button("Click here to translate ^"){}
                                .refreshable {}
                            Button("Continues"){}
                                .foregroundStyle(.white)
                                .bold()
                                .padding()
                                .containerShape(.buttonBorder)
                                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                                .background(.blue)
                                .cornerRadius(8)
                                .padding(.horizontal)
                        }}}}}}



//#Preview {ContentView()}
