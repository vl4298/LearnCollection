//
//  DLCollectionViewLayout.swift
//  DLCollectionView
//
//  Created by Dinh Luu on 16/06/2016.
//  Copyright © 2016 Dinh Luu. All rights reserved.
//

import UIKit
import QuartzCore

class DLCollectionViewLayout: UICollectionViewLayout {
  
  var cellCount = 0
  var center: CGPoint = CGPointZero
  var radius: CGFloat = 0.0
  let kItemDimension = 50.0

  override init() {
    super.init()
    
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  override func prepareLayout() {
    super.prepareLayout()
    
    let size = collectionView!.bounds.size
    cellCount = collectionView!.numberOfItemsInSection(0)
    center = CGPoint(x: size.width / 2, y: size.height / 2)
    radius = min(size.width, size.height) / 2.6
  }
  
  override func collectionViewContentSize() -> CGSize {
    super.collectionViewContentSize()
    return collectionView!.bounds.size
  }
  
  override func layoutAttributesForItemAtIndexPath(indexPath: NSIndexPath) -> UICollectionViewLayoutAttributes? {
    super.layoutAttributesForItemAtIndexPath(indexPath)
    
    let attribute = UICollectionViewLayoutAttributes(forCellWithIndexPath: indexPath)
    attribute.size = CGSize(width: kItemDimension, height: kItemDimension)
    attribute.center =
      CGPointMake(self.center.x + self.radius * CGFloat(cosf(2 * Float(indexPath.item) * Float(M_PI) / Float(self.cellCount) - Float(M_PI_2))), self.center.y + self.radius * CGFloat(sinf(2 * Float(indexPath.item) * Float(M_PI) / Float(self.cellCount) - Float(M_PI_2))));
    attribute.transform3D = CATransform3DMakeRotation( CGFloat(2 * M_PI * Double(indexPath.item) / Double(self.cellCount)), 0, 0, 1);
    return attribute;
  }
  
  override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
    super.layoutAttributesForElementsInRect(rect)
    
    var attributesArray = [UICollectionViewLayoutAttributes]()
    
    for i in 0..<cellCount {
      let indexpath = NSIndexPath(forItem: i, inSection: 0)
      attributesArray.append(self.layoutAttributesForItemAtIndexPath(indexpath)!)
    }
    
    return attributesArray
  }
}
