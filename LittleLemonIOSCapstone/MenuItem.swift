//
//  MenuItem.swift
//  LittleLemonIOSCapstone
//
//  Created by XIE CHEN on 2023/06/11.
//

import Foundation

//If here is ID UUID, it would be error. WHY?
struct MenuItem: Decodable {
    let title: String
    let price: String
    let image: String
    let description: String
    let category: String
}
