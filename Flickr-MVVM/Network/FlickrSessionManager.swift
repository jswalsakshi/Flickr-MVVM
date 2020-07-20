//
//  FlickrSessionManager.swift
//  Flickr-MVVM
//
//  Created by Sakshi Jaiswal on 20/07/20.
//  Copyright © 2020 Sakshi Jaiswal. All rights reserved.
//

import Foundation

class FlickrSessionManager: SessionManager {
    
    // MARK: - Result Parsing
    
    func parsePhotos(value: Data) -> PhotosModel? {
        do {
            let photo = try JSONDecoder().decode(PhotosModel.self, from: value)
            print(photo)
            return photo
        } catch {
            print(error)
        }
        return nil
    }
    
    // MARK: - API Request
    
    func requestPhotos(page: Int, itemsPerPage: Int, completion: @escaping ([Photo], [String: Any]) -> ()) {
        let parameters = "&page=\(page)&per_page=\(itemsPerPage)"
        getRequest(parameters: parameters) { (value) in
            if value != nil {
                let responseString = String(data: value!, encoding: .utf8)
                print("Response string:\(responseString!)")
            }
            if let  photos = self.parsePhotos(value: value!) {
                let photo = photos.photos.photo
                var metaData: [String: Int] = [:]
                metaData["currentPage"] = photos.photos.page
                metaData["totalPages"] = photos.photos.pages
                completion(photo, metaData)
            }
        }
    }
}
