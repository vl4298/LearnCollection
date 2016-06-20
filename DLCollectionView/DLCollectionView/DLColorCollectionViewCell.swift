//
//  DLColorCollectionViewCell.swift
//  DLCollectionView
//
//  Created by Dinh Luu on 17/06/2016.
//  Copyright © 2016 Dinh Luu. All rights reserved.
//

import UIKit

class DLColorCollectionViewCell: UICollectionViewCell {
  
  func setColor(color: UIColor) {
    contentView.backgroundColor = color
  }
  
  override func applyLayoutAttributes(layoutAttributes: UICollectionViewLayoutAttributes) {
    super.applyLayoutAttributes(layoutAttributes)
    self.layer.shouldRasterize = true
    self.layer.shadowColor = UIColor.blackColor().CGColor
    self.layer.shadowOffset = CGSizeMake(0, 3)
    //self.maskView.alpha = 0.0
  }
}
