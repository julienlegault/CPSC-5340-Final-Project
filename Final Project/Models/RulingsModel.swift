//
//  RulingsModel.swift
//  Final Project
//
//  Created by Julien on 4/8/24.
//

import Foundation

struct RulingsModel : Codable, Identifiable {
    let id = UUID()
    let date : String
    let text : String
}
