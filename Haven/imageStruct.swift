//
//  imageStruct.swift
//  Haven
//
//  Created by Anika Talwar on 12/5/19.
//  Copyright © 2019 Katelin Chan. All rights reserved.
//

import Foundation


struct ImageStruct: Codable {
    var success: Bool
    var data: ImageDataResponse
}

struct ImageDataResponse: Codable {
    var id: Int
    var image: String
    var listing_id: Int
}
