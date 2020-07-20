//
//  FlickrCollectionCell.swift
//  Flickr-MVVM
//
//  Created by Sakshi Jaiswal on 20/07/20.
//  Copyright © 2020 Sakshi Jaiswal. All rights reserved.
//

import UIKit

class FlickrCollectionCell: UICollectionViewCell {

  let imageView: UIImageView = {
    let imageView = UIImageView()

    imageView.contentMode = .scaleAspectFit
    imageView.translatesAutoresizingMaskIntoConstraints = true

    return imageView
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)

    imageView.frame = contentView.frame
    contentView.addSubview(imageView)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}

