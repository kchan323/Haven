//
//  NetworkManager.swift
//  Haven
//
//  Created by Katelin Chan on 12/5/19.
//  Copyright © 2019 Katelin Chan. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class NetworkManager {
    static let baseUrl = "http://35.245.152.242/"
    
    static func getMyListings (is_draft: Bool, _ didGetListings: @escaping ([Apartment]) -> Void) {
        let url = baseUrl + "api/user/" + String(user.id) + "/listings/"
        
        Alamofire.request(url, method: .get).validate().responseData { response in
        switch response.result {
            case .success(let data):
//                if let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) {
//                    print(json)
//                }
                let jsonDecoder = JSONDecoder()
                if let listings = try? jsonDecoder.decode(ListingsResponse.self, from: data) {
                    var apartments : [Apartment] = []
                    for listing in listings.data {
                        if (listing.is_draft == is_draft) {
                            let apartment = Apartment(title: listing.title, description: listing.description, rent: listing.rent, address: listing.address, is_draft: listing.is_draft)
                            self.getImage(listingId: listing.id, { image in
                                apartment.imageReceived = image
                            })
                            apartments.append(apartment)
                        }
                    }
                    didGetListings(apartments)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    static func getImage (listingId: Int, _ didGetImage: @escaping (UIImage) -> Void) {
        let url = baseUrl + "api/listing/" +  String(listingId) + "/images/"
       
        Alamofire.request(url, method: .get).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()

                if let imgData = try? jsonDecoder.decode(ImageStruct.self, from: data) {
                    //print("IMGDATA")
                    //print(imgData.data[0].image)
                    if imgData.data.count > 0 {
                           //IMG not being converted to UIImage didGetImage(imgData.data[0].image)
                        didGetImage(Image.decodeImage(strBase64: imgData.data[0].image))
                    } //else {
//                        didGetImage("")
//                    }
                }
                                   
            case .failure(let error):
                print(error.localizedDescription)
            
            }
        }
    }
    
    static func getAllListings (_ didGetListings: @escaping ([Apartment]) -> Void) {
        let url = baseUrl + "api/listings/"
        Alamofire.request(url, method: .get).validate().responseData { response in
        switch response.result {
            case .success(let data):
//                if let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) {
//                    print(json)
//                }
                let jsonDecoder = JSONDecoder()
                if let listings = try? jsonDecoder.decode(ListingsResponse.self, from: data) {
                    var apartments : [Apartment] = []
                    for listing in listings.data {
                        let apartment = Apartment(title: listing.title, description: listing.description, rent: listing.rent, address: listing.address, is_draft: listing.is_draft)
                        self.getImage(listingId: listing.id, { image in
                                apartment.imageReceived = image
                        })
                        apartments.append(apartment)
                    }
                    didGetListings(apartments)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    static func postUser (name: String, _ didGetUser: @escaping (User) -> Void) {
        let url = baseUrl + "api/users/"
        let parameters: [String: Any] = [
            "name": name
        ]
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default).validate().responseData { response in
            switch response.result {
            case .success(let data):
//                if let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) {
//                    print(json)
//                }
                let jsonDecoder = JSONDecoder()
                if let decodedUser = try? jsonDecoder.decode(UserResponse.self, from: data) {
                    didGetUser(decodedUser.data)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    static func postSublet (apartment: Apartment) {
        let url = baseUrl + "api/user/" + String (user.id) + "/listings/"
        let parameters: [String: Any] = [
            "title": apartment.title,
            "is_draft": apartment.is_draft,
            "description": apartment.description,
            "rent": apartment.rent,
            "address": apartment.address
        ]

        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                
                if let listingData = try? jsonDecoder.decode(ListingResponse.self, from: data) {
                    self.postImage(image: apartment.image, listingId: listingData.data.id)
//                    print(listingData)
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    static func postImage (image: String, listingId: Int) {
        let url = baseUrl + "api/listing/" +  String(listingId) + "/images/"

        let parameters: [String: Any] = [
            "image": image
        ]
       
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                if let imgData = try? jsonDecoder.decode(ImageStruct.self, from: data) {
//                    print(imgData.data)
                }
            case .failure(let error):
                print(error.localizedDescription)
            
            }
        }
    }
}
