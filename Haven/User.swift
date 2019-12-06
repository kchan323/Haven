//
//  User.swift
//
//
//  Created by Katelin Chan on 12/5/19.
//

import Foundation

struct User : Codable {
    var id: Int
    var name: String
}

struct UserResponse: Codable {
    var data: User
}
