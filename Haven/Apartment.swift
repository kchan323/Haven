//
//  Apartment.swift
//  Haven
//
//  Created by Katelin Chan on 11/19/19.
//  Copyright © 2019 Katelin Chan. All rights reserved.
//
import Foundation
import UIKit

class Apartment {
    var id: Int
    var image: String
    var imageReceived: UIImage?
    var title: String
    var description: String
    var rent: Int
    var address: String
    var is_draft: Bool
    var electricity: Bool
    var wifi: Bool
    var water: Bool
    var trash: Bool
    var heat: Bool
    
    init(id: Int = 0, image: String, title: String, description: String, rent: Int, address: String, is_draft: Bool, type: String, electricity: Bool, wifi: Bool, water: Bool, trash: Bool, heat: Bool) {
        self.id = id
        self.image = image
        self.title = title
        self.description = description
        self.rent = rent
        self.address = address
        self.is_draft = is_draft
        self.electricity = electricity
        self.wifi = wifi
        self.water = water
        self.trash = trash
        self.heat = heat
    }
    
    init(id: Int = 0, title: String, description: String, rent: Int, address: String, is_draft: Bool) {
        self.id = id
        self.title = title
        self.description = description
        self.rent = rent
        self.address = address
        self.is_draft = is_draft
        
        self.image = ""
        self.electricity = false
        self.wifi = false
        self.water = false
        self.trash = false
        self.heat = false
    }
    
}
