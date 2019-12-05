//
//  Listing.swift
//  Haven
//
//  Created by Anika Talwar on 12/5/19.
//  Copyright © 2019 Katelin Chan. All rights reserved.
//

import Foundation

//"success": True,
//"data": {
//  "id": 0,
//  "user_id": 1,
//  "title": "Spacious 2BR Apt. in the heart of Collegetown",
//  "is_draft": False
//  "description": "All new, fully furnished apartment.\n 5 minutes from the engineering quad.",
//  "rent": 1050,
//  "address": "717 E. Buffalo Street",
//  "images": [ <IMAGES> ],
//  "collections": [ <COLLECTIONS> ]
//}

struct Listing: Codable {
    var success: Bool
    var data: ListingDataResponse
}

struct ListingDataResponse: Codable {
    
    var id: Int
    var user_id: Int
    var title: String
    var is_draft: Bool
    var description: String
    var rent: Int
    var address: String
   
}
