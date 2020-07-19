//
//  SessionManager.swift
//  Flickr-MVVM
//
//  Created by Sakshi Jaiswal on 18/07/20.
//  Copyright © 2020 Sakshi Jaiswal. All rights reserved.
//

import Foundation


class SessionManager {
    
    let defaultSession = URLSession(configuration: .default)
    
    var dataTask: URLSessionDataTask?
    var errorMessage = " "
    let listingUrl = "http://jsonplaceholder.typicode.com/posts"
    typealias QueryResult = ([UserListing]?, String) -> Void
    var users: [UserListing] = []
    
    
    
    func getUserResults(completion: @escaping QueryResult) {
        dataTask?.cancel()
        if var urlComponents = URLComponents(string: "http://jsonplaceholder.typicode.com/posts") {
            guard let url = urlComponents.url else {
                return
            }
            dataTask = defaultSession.dataTask(with: url) { [weak self] data, response, error in
                defer {
                    self?.dataTask = nil
                }
                if let error = error {
                    self?.errorMessage += "DataTask error: " + error.localizedDescription + "\n"
                } else if
                    let data = data,
                    let response = response as? HTTPURLResponse,
                    response.statusCode == 200 {
                    self?.users = (self?.parseListingData(value: data))!
                    DispatchQueue.main.async {
                        completion(self?.users, self?.errorMessage ?? "")
                    }
                }
            }
            dataTask?.resume()
        }
    }
    
    func parseListingData(value: Data) -> [UserListing]? {
        do {
            let listing = try JSONDecoder().decode([UserListing].self, from: value)
            print(listing)
            return listing
        } catch {
            print(error)
        }
        return nil
    }
}
