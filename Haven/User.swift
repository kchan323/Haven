//
//  User.swift
//
//
//  Created by Katelin Chan on 12/5/19.
//

import Foundation

struct User : Codable {
    var userId: Int
    var name: String
}

struct UserResponse: Codable {
    var data: [User]
}
