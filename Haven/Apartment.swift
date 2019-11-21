//
//  Apartment.swift
//  Haven
//
//  Created by Katelin Chan on 11/19/19.
//  Copyright © 2019 Katelin Chan. All rights reserved.
//

import Foundation

class Apartment {
    var image: String
    var title: String
    var description: String
    var price: Int
    var address: String
//    var type: String //apartment or house

    var electricity: Bool
    var wifi: Bool
    var water: Bool
    var trash: Bool
    var heat: Bool
    
    init(image: String, title: String, description: String, price: Int, address: String, type: String, electricity: Bool, wifi: Bool, water: Bool, trash: Bool, heat: Bool) {
        self.image = image
        self.title = title
        self.description = description
        self.price = price
        self.address = address
//        self.type = type //apartment or house

        self.electricity = electricity
        self.wifi = wifi
        self.water = water
        self.trash = trash
        self.heat = heat
    }
    
}
