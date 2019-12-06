//
//  User.swift
//
//
//  Created by Katelin Chan on 12/5/19.
//

import Foundation

struct UserResponse: Codable {
    var success: Bool
    var data: User
}

struct User : Codable {
    var id: Int
    var name: String
}
