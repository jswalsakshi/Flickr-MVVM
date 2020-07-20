//
//  DetailViewModel.swift
//  Flickr-MVVM
//
//  Created by Sakshi Jaiswal on 19/07/20.
//  Copyright © 2020 Sakshi Jaiswal. All rights reserved.
//

import Foundation

class DetailsViewModel {
    
    var listingDetail = [ListingModel]()
    
    var count: Int {
        return listingDetail.count
    }
    
    func getPost(index: Int) -> ListingModel  {
        return listingDetail[index]
    }
    
    func changeExapnad(index: Int) {
        var model = self.getPost(index: index)
        let expandble = model.isExpandable ?? false
        model.changeIsExpandable(to: !expandble)
        self.listingDetail[index] = model
    }
    
    init(models: [ListingModel]) {
        self.listingDetail = models
    }
}
