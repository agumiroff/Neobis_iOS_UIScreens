//
//  SinglesData.swift
//  Neobis_iOS_UIScreens
//
//  Created by G G on 11.04.2023.
//

import Foundation

struct SinglesModel: Identifiable {
    var id = UUID()
    
    let title: String
    let text: String
    let imageName: String
    let alignment: SinglesData.Alignment
}


enum SinglesData {
    
    enum Alignment {
        case left
        case right
    }
    
    static let array = [
        SinglesModel(title: "SOS",
                     text: "Mini meltdown? Get some Headspace in a hurry",
                     imageName: "text.book.closed.fill", alignment: .left),
        SinglesModel(title: "On-the-Go",
                     text: "Mindful living? Get your Headspace to go",
                     imageName: "books.vertical.fill", alignment: .right),
        SinglesModel(title: "Classic",
                     text: "Like it simple? Get some extra Headspace",
                     imageName: "list.dash.header.rectangle", alignment: .left),
        SinglesModel(title: "On-the-Go",
                     text: "Mindful living? Get your Headspace to go",
                     imageName: "globe.desk.fill", alignment: .right),
    ]
}
