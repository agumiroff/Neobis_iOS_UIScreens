//
//  CryptoMainScreenVC.swift
//  Neobis_iOS_UIScreens
//
//  Created by G G on 08.04.2023.
//

import SwiftUI

struct CryptoMainScreenVC: View {
    @State private var selection = 1
    
    var body: some View {
        VStack {
            TabView{
                MainView()
                    .tabItem {
                        Image(systemName: "square.grid.2x2")
                    }
                    .tag(1)
                RedView()
                    .tabItem {
                        Image(systemName: "bolt.circle")
                    }
                    .tag(2)
                BlueView()
                    .tabItem {
                        Image(systemName: "person")
                    }
                    .tag(3)
            }
            .tint(.red)
        }
    }
}

struct MainView: View {
    var body: some View {
        VStack {
            HeaderView()
            CollectionView()
            Spacer()
        }
        .padding([.trailing, .leading], 28)
    }
    
    //MARK: Header
    @ViewBuilder
    func HeaderView() -> some View {
        HStack {
            Text("Портфолио")
                .font(.largeTitle.bold())
                .hAlign(.leading)
                .frame(width: .infinity)
            Image(systemName: "gear")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: 24, maxHeight: 24)
                .foregroundColor(.gray)
        }
        .frame(height: 60)
    }
    
    //MARK: Collection
    @ViewBuilder
    func CollectionView() -> some View {
        VStack {
            
            Button("посмотреть все") {
                print("посмотреть все")
            }
            .hAlign(.trailing)
            .padding(.top, 40)
            .foregroundColor(.red)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 5) {
                    ForEach(Data.arrayOfData) { row in
                        VStack {
                            CollectionRow(pictureName: row.shortName,
                                          coinName: row.name,
                                          shortName: row.shortName,
                                          profit: row.profit,
                                          price: row.price,
                                          count: row.count)
                            .padding([.top,.bottom], 10)
                            Divider()
                        }
                    }
                }
            }
            .scrollIndicators(.hidden)
        }
        .padding([.top, .bottom], 15)
    }
    
    //MARK: CollectionView row
    @ViewBuilder
    func CollectionRow(pictureName: String,
                       coinName: String,
                       shortName: String,
                       profit: Double,
                       price: Double,
                       count: Double) -> some View {
        HStack {
            ZStack {
                Image("\(pictureName)_back")
                Image(pictureName)
            }
            VStack {
                Text(coinName)
                    .font(.title2.bold())
                    .hAlign(.leading)
                    .padding(.bottom, 5)
                
                Text("\(profit)%")
                    .font(.body)
                    .foregroundColor(.gray)
                    .hAlign(.leading)
                
            }
            .padding(.leading, 12)
            Spacer()
            VStack {
                Text(String(price))
                    .font(.body)
                    .hAlign(.trailing)
                    .padding(.bottom, 5)
                
                Text("\(count) \(shortName)")
                    .font(.body)
                    .foregroundColor(.gray)
                    .hAlign(.trailing)
            }
        }
        .hAlign(.leading)
        .frame(height: 50)
    }
}

struct RedView: View {
    var body: some View {
        Color.red
            .padding(.bottom, 15)
    }
}

struct BlueView: View {
    var body: some View {
        Color.blue
            .padding(.bottom, 15)
    }
}


struct CryptoMainScreenVC_Previews: PreviewProvider {
    static var previews: some View {
        CryptoMainScreenVC()
    }
    
}

extension View {
    
    func hAlign(_ alignment: Alignment) -> some View {
        self
            .frame(maxWidth: .infinity, alignment: alignment)
    }
    
    func vAlign(_ alignment: Alignment) -> some View {
        self
            .frame(maxHeight: .infinity, alignment: alignment)
    }
}
