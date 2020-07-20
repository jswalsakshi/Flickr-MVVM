//
//  SessionManager.swift
//  Flickr-MVVM
//
//  Created by Sakshi Jaiswal on 19/07/20.
//  Copyright © 2020 Sakshi Jaiswal. All rights reserved.
//

import Alamofire

class SessionManager {
    // MARK: - Properties
    
    let baseURL = "https://api.flickr.com/services/rest/"
    let format = "&format=json&nojsoncallback=1"
    
    let listingUrl = "http://jsonplaceholder.typicode.com/posts"
    
    let method = "flickr.photos.getRecent"
    
    // MARK: - API Requests
    
    func getRequest(parameters: String, completion: @escaping (Data?) -> ()) {
        let apiKey = ApiConstants.apiKey
        let url = baseURL + "?method=\(method)\(format)\(parameters)&api_key=\(apiKey)"
        
        Alamofire.request(url, method: .get).validate().responseData { dataResponse in
            if let error = dataResponse.result.error {
                print(error)
                completion(nil)
            }
            else if dataResponse.response?.statusCode == 200 || dataResponse.response?.statusCode == 201 {
                completion(dataResponse.result.value)
            } else {
                completion(nil)
            }
        }
    }
    
    func getRequestForPostListing(completion: @escaping (Data?) -> ()) {
        Alamofire.request(listingUrl, method: .get).validate().responseData { dataResponse in
            if let error = dataResponse.result.error {
                print(error)
                completion(nil)
            }
            else if dataResponse.response?.statusCode == 200 || dataResponse.response?.statusCode == 201 {
                completion(dataResponse.result.value)
                
            } else {
                completion(nil)
            }
        }
    }
}


