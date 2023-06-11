//
//  MenuItem.swift
//  LittleLemonIOSCapstone
//
//  Created by XIE CHEN on 2023/06/11.
//

import Foundation

struct MenuItem: Decodable, Identifiable {
    var id = UUID()
    let title: String
    let price: String
    let image: String
}
