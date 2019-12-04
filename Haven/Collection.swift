//
//  Collection.swift
//  Haven
//
//  Created by Katelin Chan on 12/4/19.
//  Copyright © 2019 Katelin Chan. All rights reserved.
//

import Foundation

class Collection {
    var title: String
    var apartments: [Apartment]!

    init(title: String, apartments: [Apartment]) {
        self.title = title
        self.apartments = apartments
    }
    
}
