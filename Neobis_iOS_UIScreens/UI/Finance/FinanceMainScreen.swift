//
//  FinanceMainScreen.swift
//  Neobis_iOS_UIScreens
//
//  Created by G G on 10.04.2023.
//

import SwiftUI

struct FinanceMainScreen_Previews: PreviewProvider {
    static var previews: some View {
        FinanceMainScreen()
    }
}
struct FinanceRedView: View {
    var body: some View {
        Color.red
            .padding(.bottom, 15)
    }
}

struct FinanceBlueView: View {
    var body: some View {
        Color.blue
            .padding(.bottom, 15)
    }
}

struct FinanceMainScreen: View {
    var body: some View {
        VStack {
            TabView{
                FirstScreen()
                    .padding(.bottom, 15)
                    .tabItem {
                        Image(systemName: "chart.pie.fill")
                        Text("Главная")
                    }
                    .tag(1)
                FinanceRedView()
                    .tabItem {
                        Image(systemName: "chart.bar.xaxis")
                        Text("Отчеты")
                    }
                    .tag(2)
                FinanceBlueView()
                    .tabItem {
                        Image(systemName: "person")
                        Text("Профиль")
                    }
                    .tag(3)
            }
            .tint(.black)
        }
    }
}

struct FirstScreen: View {
    @State private var animation = false
    @State private var index = 1
    
    var body: some View {
        ZStack {
            Color(.systemGray6)
                .ignoresSafeArea()
            VStack {
                VStack{
                    Text("Баланс")
                    Text("$1200.89")
                        .font(.system(size: 36).weight(.semibold))
                }
                .padding(.top, 15)
                DateScroll()
                VerticalScrollView()
            }
        }
    }
    //MARK: Horizontal DateScroll
    @ViewBuilder
    func DateScroll() -> some View {
        HStack {
            Button {
                index = index == 1 ? 12 : index - 1
                animation.toggle()
            } label: {
                Image(systemName: "chevron.left")
                    .foregroundColor(.black)
            }
            
            TabView(selection: $index) {
                ForEach((1...12), id: \.self) {index in
                    Text("Апрель 2020 \(index) ")
                }
            }
            .animation(.easeInOut, value: animation)
            .transition(.slide)
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .frame(height: 50)
            
            Button {
                index = index == 12 ? 1 : index + 1
                animation.toggle()
            } label: {
                Image(systemName: "chevron.right")
                    .foregroundColor(.black)
            }
        }
        .padding([.leading, .trailing], 50)
        .padding([.top, .bottom], 15)
    }
    
    //MARK: Vertical scroll
    @ViewBuilder
    func VerticalScrollView() -> some View {
        ZStack {
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(30)
                .padding(.bottom)
            
            VStack {
                SwiftUI.ScrollView {
                    VStack(alignment: .leading, spacing: 5) {
                        ForEach(FinanceData.arrayOfData, content: { element in
                            ScrollRow(model: element)
                            Divider()
                                .foregroundColor(.gray)
                                .padding(.leading, 61)
                        })
                    }
                }
                Text("См. еще")
                    .hAlign(.center)
                    .padding(30)
            }
        }
    }
    
    //MARK: Vertical scroll row
    @ViewBuilder
    func ScrollRow(model: FinanceModel) -> some View {
        HStack {
            ZStack{
                Circle()
                    .fill(model.color)
                    .frame(width: 30, height: 30)
                Image(systemName: model.imageName)
                .foregroundColor(.white)
            }
            
            Text(model.categoryName)
                .padding(.leading, 15)
            
            Spacer()
            
            VStack {
                Text("$\(model.amount)")
                    .font(.title2.bold())
                    .hAlign(.trailing)
                Text(model.itemName)
                    .foregroundColor(.gray)
                    .hAlign(.trailing)
            }
            
        }
        .padding(15)
    }
}
