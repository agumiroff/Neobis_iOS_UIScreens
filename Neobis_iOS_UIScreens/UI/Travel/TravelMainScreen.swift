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
            
            HStack {
                Text(searchHint)
                    .foregroundColor(.blue)
                Spacer()
                Image(systemName: "magnifyingglass")
            }
            .padding(15)
            .background(.white)
            .border(.black)
            
            TextField("", text: $text) { focused in
                searchHint = focused ? "" : "Куда хотите поехать?"
            }
        }
    }
}
