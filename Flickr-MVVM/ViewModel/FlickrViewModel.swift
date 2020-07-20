//
//  FlickrViewModel.swift
//  Flickr-MVVM
//
//  Created by Sakshi Jaiswal on 20/07/20.
//  Copyright © 2020 Sakshi Jaiswal. All rights reserved.
//

import Foundation

class FlickrViewModel: FlickrCollectionViewModel {

  // MARK: - Static Properties

  let reuseIdentifier = "PhotosRecentViewCell"
  
  let itemsPerPage = 30
  let itemsPerRow = 2
  let itemsPerSection = 10
  let itemsTreshold = 15
  
  // MARK: - Properties

  let flickrSessionManager: FlickrSessionManager
  
  var photosData: [Photo] = []
  var currentPage = 0
  var totalPages = 0
  
  // MARK: - Lifecycle
  
  init() {
    flickrSessionManager = FlickrSessionManager()
  }
  
  // MARK: - Data Interaction
  
  func requestNextPhotosPage(completion:@escaping () -> ()) {
    currentPage += 1
    
    flickrSessionManager.requestPhotos(page: currentPage, itemsPerPage: itemsPerPage) { (photos, metaData) in
      self.photosData.append(contentsOf: photos)
      
      self.currentPage = metaData["currentPage"] as! Int
      self.totalPages = metaData["totalPages"] as! Int
      
      completion()
    }
  } 
}
