//
//  SinglesScreen.swift
//  Neobis_iOS_UIScreens
//
//  Created by G G on 11.04.2023.
//

import SwiftUI

struct SinglesScreen_Previews: PreviewProvider {
    static var previews: some View {
        SinglesScreen()
    }
}

struct SinglesRedView: View {
    var body: some View {
        Color.red
    }
}

struct SinglesBlueView: View {
    var body: some View {
        Color.blue
    }
}

struct SinglesScreen: View {
    var body: some View {
        TabView {
            MainScreen()
                .tabItem {
                    Image(systemName: "chart.pie.fill")
                    Text("Series")
                }
                .tag(1)
            SinglesRedView()
                .tabItem {
                    Image(systemName: "chart.bar.xaxis")
                    Text("Headspace")
                }
                .tag(2)
            SinglesBlueView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
                .tag(3)
        }
        .tint(.black)
    }
    
}

struct MainScreen: View {
    var body: some View {
        NavigationView {
            
            ScrollView()
                .scrollIndicators(.never)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            print("menu")
                        } label: {
                            Image(systemName: "text.justify")
                        }
                    }
                    
                    ToolbarItem(placement: .principal) {
                        Text("Singles")
                            .font(.system(size: 22))
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            print("search")
                        } label: {
                            Image(systemName: "magnifyingglass")
                            
                        }
                    }
                }
                .foregroundColor(.black)
        }
    }
    
    @ViewBuilder
    func ScrollView() -> some View {
        SwiftUI.ScrollView(content: {
            VStack(spacing: 0) {
                ForEach(SinglesData.array) { element in
                    if element.alignment == .left {
                        LeftTextRow(title: element.title,
                                    text: element.text,
                                    imageName: element.imageName)
                        .frame(height: 174)
                    } else {
                        RightTextRow(title: element.title,
                                     text: element.text,
                                     imageName: element.imageName)
                        .frame(height: 174)
                    }
                    
                }
            }
        })
    }
    
    @ViewBuilder
    func LeftTextRow(title: String,
                     text: String,
                     imageName: String) -> some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color(.systemBackground))
                .shadow(color: Color(red: 0,
                                     green: 0,
                                     blue: 0,
                                     opacity: 0.25),
                        radius: 5)
            HStack {
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.system(size: 30))
                    Text(text)
                        .font(.system(size: 16))
                }
                Spacer()
                Image(systemName: imageName)
                    .font(.system(size: 80))
                Image(systemName: "chevron.right")
                    .font(.system(size: 40))
            }
            .padding()
        }
    }
    
    @ViewBuilder
    func RightTextRow(title: String,
                      text: String,
                      imageName: String) -> some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color(.systemBackground))
                .shadow(color: Color(red: 0,
                                     green: 0,
                                     blue: 0,
                                     opacity: 0.25),
                        radius: 5)
            HStack {
                Image(systemName: imageName)
                    .font(.system(size: 80))
                Spacer()
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.system(size: 30))
                    Text(text)
                        .font(.system(size: 16))
                }
                Image(systemName: "chevron.right")
                    .font(.system(size: 40))
            }
            .padding()
        }
    }
}


