//
//  Image.swift
//  Haven
//
//  Created by Anika Talwar on 12/5/19.
//  Copyright © 2019 Katelin Chan. All rights reserved.
//

import Foundation
import UIKit

class Image {
    
    var id: Int
    var imageString: String
    var listing_id: Int
    
    init(id:Int, imageString:String, listing_id:Int){
        self.id = id
        self.imageString = imageString
        self.listing_id = listing_id
    }
    
    static func encodeImage(imageData: NSData) -> String {
        let strBase64 = imageData.base64EncodedString(options: .lineLength64Characters)
        return strBase64
        
    }
    
    static func decodeImage(strBase64: String) -> UIImage{
        let dataDecoded:NSData = NSData(base64Encoded: strBase64, options: NSData.Base64DecodingOptions(rawValue: 0))!
        let decodedimage:UIImage = UIImage(data: dataDecoded as Data)!
        return decodedimage
    }
    
}

