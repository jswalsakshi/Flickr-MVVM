//
//  FlickrCollectionViewModel.swift
//  Flickr-MVVM
//
//  Created by Sakshi Jaiswal on 20/07/20.
//  Copyright © 2020 Sakshi Jaiswal. All rights reserved.
//

import Foundation

protocol FlickrCollectionViewModel {
    
    var reuseIdentifier: String { get }
    
    var itemsPerPage: Int { get }
    var itemsPerRow: Int { get }
    var itemsPerSection: Int { get }
    var itemsTreshold: Int { get }
    
    var photosData: [Photo] { get set }
    var currentPage: Int { get set }
    var totalPages: Int { get set }
    func requestNextPhotosPage(completion:@escaping () -> ())
    
}
