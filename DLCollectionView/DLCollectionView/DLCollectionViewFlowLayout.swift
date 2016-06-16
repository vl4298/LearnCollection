//
//  DLCollectionViewFlowLayout.swift
//  DLCollectionView
//
//  Created by Dinh Luu on 16/06/2016.
//  Copyright © 2016 Dinh Luu. All rights reserved.
//

import UIKit

class DLCollectionViewFlowLayout: UICollectionViewFlowLayout {
  
  

  override init() {
    super.init()
    self.scrollDirection = .Horizontal
    minimumInteritemSpacing = 200
    minimumLineSpacing = -60
    itemSize = CGSizeMake(180, 180)
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  override class func layoutAttributesClass() -> AnyClass {
    return DLCollectionViewLayoutAttribute.self
  }
  
  override func shouldInvalidateLayoutForBoundsChange(newBounds: CGRect) -> Bool {
    return true
  }
  
  override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
    print("rect Parameter: \(rect)")
    print("collectionView contentOffset: \(self.collectionView?.contentOffset)")
    
    let layoutAttributeArray = super.layoutAttributesForElementsInRect(rect)
    let visibleRect = CGRect(x: collectionView!.contentOffset.x, y: collectionView!.contentOffset.y, width: CGRectGetWidth(collectionView!.bounds), height: CGRectGetHeight(collectionView!.bounds))
    for attribute in layoutAttributeArray! {
      if CGRectIntersectsRect(attribute.frame, visibleRect) {
        
      }
    }
    
    return layoutAttributeArray
  }
  
  override func layoutAttributesForItemAtIndexPath(indexPath: NSIndexPath) -> UICollectionViewLayoutAttributes? {
    let attribute = super.layoutAttributesForItemAtIndexPath(indexPath)
    
    let visibleRect = CGRect(x: collectionView!.contentOffset.x, y: collectionView!.contentOffset.y, width: CGRectGetWidth(collectionView!.bounds), height: CGRectGetHeight(collectionView!.bounds))
    return attribute
  }
  
  private func applyLayoutAttribute(attribute: UICollectionViewLayoutAttributes, atIndexPath indexPath: NSIndexPath) {
  
  }
}
