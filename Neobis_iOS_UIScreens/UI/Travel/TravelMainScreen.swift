//
//  TravelMainScreen.swift
//  Neobis_iOS_UIScreens
//
//  Created by G G on 11.04.2023.
//

import SwiftUI

struct TravelMainScreen_Previews: PreviewProvider {
    static var previews: some View {
        TravelMainScreen()
    }
}

struct TravelMainScreen: View {
    @State var isSearchActive = false
    @State var text = ""
    @State var searchHint = "Куда хотите поехать?"
    var body: some View {
        VStack {
            Greetings()
            Search()
            ScrollView()
        }
    }
    
    @ViewBuilder
    func Greetings() -> some View {
        Text("Путешествуйте\nПочувствуйте прилив энергии")
            .font(.title)
            .multilineTextAlignment(.center)
        Text("Мы поможем вам исследовать, сравнить и забронировать впечатления - все в одном месте.")
            .multilineTextAlignment(.center)
            .padding(11)
    }
    
    @ViewBuilder
    func Search() -> some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color(.systemBackground))
                .cornerRadius(5)
                .shadow(color: Color(red: 0,
                                     green: 0,
                                     blue: 0,
                                     opacity: 0.25),
                        radius: 5)
            HStack {
                Text(searchHint)
                    .foregroundColor(.blue)
                Spacer()
                Image(systemName: "magnifyingglass")
            }
            .padding(15)
            
            TextField("", text: $text) { focused in
                searchHint = focused ? "" : "Куда хотите поехать?"
            }
        }
        .frame(height: 40)
        .padding()
    }
    
    @ViewBuilder
    func ScrollView() -> some View {
        SwiftUI.ScrollView {
            ForEach(TravelData.array) { city in
                Image(city.imageName)
                    .padding(.bottom)
            }
        }
        .scrollIndicators(.never)
    }
}
