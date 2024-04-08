//
//  UserModel.swift
//  Final Project
//
//  Created by Julien on 4/8/24.
//

import Foundation

struct UserModel: Codable, Identifiable {
    var id: String?
    var email: String
    var password: String
}
