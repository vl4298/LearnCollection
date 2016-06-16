//
//  DLCollectionViewCell.swift
//  DLCollectionView
//
//  Created by Dinh Luu on 16/06/2016.
//  Copyright © 2016 Dinh Luu. All rights reserved.
//

import UIKit

class DLCollectionViewCell: UICollectionViewCell {

  var text = "" {
    didSet {
      textLb.text = text
      setNeedsDisplay()
    }
  }
  
  private var textLb: UILabel! = nil
  override init(frame: CGRect) {
    super.init(frame: frame)
    textLb = UILabel(frame: contentView.bounds)
    textLb.font = UIFont.boldSystemFontOfSize(10)
    textLb.textAlignment = .Center
    textLb.textColor = UIColor.blackColor()
    contentView.addSubview(textLb)
    
    backgroundColor = UIColor.whiteColor()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    text = ""
  }
  
  override func applyLayoutAttributes(layoutAttributes: UICollectionViewLayoutAttributes) {
    super.applyLayoutAttributes(layoutAttributes)
    
    self.textLb.center = CGPoint(x: CGRectGetWidth(contentView.bounds) / 2, y: CGRectGetHeight(contentView.bounds) / 2)
  }
}
