//
//  CardModel.swift
//  Final Project
//
//  Created by Julien on 4/8/24.
//

import Foundation

struct CardResults : Codable {
    let cards : [CardModel]
}

struct CardModel : Codable, Identifiable {
    let id : String
    let name : String
    let type : String
    let manaCost : String
    let text : String
    let rulings : [RulingsModel]?
    let power : String?
    let toughness : String?
}
