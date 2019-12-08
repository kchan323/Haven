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

    static func decodeImage(strBase64: String) -> UIImage {

        if let dataDecoded = NSData(base64Encoded: strBase64, options: .ignoreUnknownCharacters),
            let decodedimage = UIImage(data: dataDecoded as Data) {
            return decodedimage
        } else {
            return UIImage(named: "apartment") ?? UIImage()
        }
        
    


    }

}
