//
//  SessionManager.swift
//  Flickr-MVVM
//
//  Created by Sakshi Jaiswal on 19/07/20.
//  Copyright © 2020 Sakshi Jaiswal. All rights reserved.
//

import Foundation

class SessionManager {
  // MARK: - Properties

  let baseURL = "https://api.flickr.com/services/rest/"
  let format = "&format=json&nojsoncallback=1"
  
  let listingUrl = "http://jsonplaceholder.typicode.com/posts"
  
  let method = "flickr.photos.getRecent"

  // MARK: - API Requests
  
  //TODO: we can create a common class and put Alamofire.request method there. leaving it for now

//  func getRequest(parameters: String, completion:@escaping (Data?) -> ()) {
//    let apiKey = ApiConstants.apiKey
//    let url = baseURL + "?method=\(method)\(format)\(parameters)&api_key=\(apiKey)"
//
//    Alamofire.request(url, method: .get).validate().responseData { dataResponse in
//     
//      if let error = dataResponse.result.error {
//        // error could be any of the NSURLErrorDomain like NSURLErrorCannotFindHost
//        print(error)
//        completion(nil)
//      }
//      else if dataResponse.response?.statusCode == 200 || dataResponse.response?.statusCode == 201 {
//        completion(dataResponse.result.value)
//        
//      } else {
//        // if status code is not 200 (success)
//        completion(nil)
//      }
//    }
//    }

    func getRequestForPostListing(completion:@escaping (Data?) -> ()) {
        
        URLSession.shared.dataTask(with: URL(string: "http://jsonplaceholder.typicode.com/posts")!) {(data, response, error) in
            
            if let error = error {
                // error could be any of the NSURLErrorDomain like NSURLErrorCannotFindHost
                print(error)
                completion(nil)
            }
            else if let data = data{
                DispatchQueue.main.async {
                    completion(data)
                }
                
            } else {
                // if status code is not 200 (success)
                completion(nil)
            }
        }.resume()
    }
}
