//
//  Listing.swift
//  Haven
//
//  Created by Anika Talwar on 12/5/19.
//  Copyright © 2019 Katelin Chan. All rights reserved.
//

import Foundation

struct ListingResponse: Codable {
    var success: Bool
    var data: Listing
}

struct ListingsResponse: Codable {
    var success: Bool
    var data: [Listing]
}

struct Listing: Codable {
    var id: Int
    var user_id: Int
    var title: String
    var is_draft: Bool
    var description: String
    var rent: Int
    var address: String
}
