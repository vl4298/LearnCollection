//
//  DLCollectionViewLayoutAttribute.swift
//  DLCollectionView
//
//  Created by Dinh Luu on 16/06/2016.
//  Copyright © 2016 Dinh Luu. All rights reserved.
//

import UIKit

class DLCollectionViewLayoutAttribute: UICollectionViewLayoutAttributes {

  var shouldRasterize: Bool!
  var maskingValue: CGFloat!
  
  override func copyWithZone(zone: NSZone) -> AnyObject {
    let attribute = super.copyWithZone(zone) as! DLCollectionViewLayoutAttribute
    attribute.shouldRasterize = self.shouldRasterize
    attribute.maskingValue = self.maskingValue
    return attribute
  }
  
  override func isEqual(object: AnyObject?) -> Bool {
    super.isEqual(object)
    let attribute = object as! DLCollectionViewLayoutAttribute
    return (attribute.shouldRasterize == self.shouldRasterize) && (attribute.maskingValue == self.maskingValue)
  }
}
