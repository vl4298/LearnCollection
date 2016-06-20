//
//  DLStackColllectionViewLayoutAttribute.swift
//  DLCollectionView
//
//  Created by Dinh Luu on 17/06/2016.
//  Copyright © 2016 Dinh Luu. All rights reserved.
//

import UIKit

class DLStackColllectionViewLayoutAttribute: UICollectionViewLayoutAttributes {
  
  var shadowOpacity: CGFloat! = 0
  var maskValue: CGFloat! = 0
  
  override func copyWithZone(zone: NSZone) -> AnyObject {
    let attributes = super.copyWithZone(zone) as! DLStackColllectionViewLayoutAttribute
    attributes.shadowOpacity = self.shadowOpacity
    attributes.maskValue = self.maskValue
    
    return attributes
  }
  
  override func isEqual(object: AnyObject?) -> Bool {
    let attribute = object as! DLStackColllectionViewLayoutAttribute
    if self.shadowOpacity == attribute.shadowOpacity && self.maskValue == attribute.maskValue {
      return true
    }
    return false
  }
}
