//
//  UserListResponseModel.swift
//  Flickr-MVVM
//
//  Created by Sakshi Jaiswal on 18/07/20.
//  Copyright © 2020 Sakshi Jaiswal. All rights reserved.
//

import Foundation

struct UserListing: Codable {
  var userId: Int
  var id: Int
  var title: String
  var body: String
  var isExpandable: Bool?
  
  mutating func changeIsExpandable(to isExpandable: Bool){
    self.isExpandable = isExpandable
  }
}
