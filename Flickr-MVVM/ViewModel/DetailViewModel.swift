//
//  DetailViewModel.swift
//  Flickr-MVVM
//
//  Created by Sakshi Jaiswal on 19/07/20.
//  Copyright © 2020 Sakshi Jaiswal. All rights reserved.
//

import Foundation

class DetailsViewModel {
 
  var listingDetail = [UserListing]()

  var count: Int {
    return listingDetail.count
  }

  func getPost(index: Int) -> UserListing  {
    return listingDetail[index]
  }

  func changeExapnad(index: Int) {
    var  model = self.getPost(index: index)
    let expandble = model.isExpandable ?? false
    model.changeIsExpandable(to: !expandble)
    self.listingDetail[index] = model
  }

  init(models: [UserListing]) {
    self.listingDetail = models
  }
}
