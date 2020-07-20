//
//  PhotoModel.swift
//  Flickr-MVVM
//
//  Created by Sakshi Jaiswal on 20/07/20.
//  Copyright © 2020 Sakshi Jaiswal. All rights reserved.
//

import Foundation

struct PhotosModel: Codable {
    var photos: Photos
}

struct Photos: Codable {
    var photo: [Photo]
    var page: Int
    var pages: Int
    var perpage: Int
    var total: Int
}

struct Photo: Codable {
    let farm: Int
    let server: String
    let id: String
    let secret: String
    let title: String
}


extension Photo {
    
    func imageURL() -> String {
        return "https://farm\(farm).static.flickr.com/\(server)/\(id)_\(secret).jpg"
    }
    
}
