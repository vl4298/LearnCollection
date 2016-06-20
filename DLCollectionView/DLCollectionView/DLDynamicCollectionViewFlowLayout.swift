//
//  DLDynamicCollectionViewFlowLayout.swift
//  DLCollectionView
//
//  Created by Dinh Luu on 20/06/2016.
//  Copyright © 2016 Dinh Luu. All rights reserved.
//

import UIKit

class DLDynamicCollectionViewFlowLayout: UICollectionViewFlowLayout {
  
  var dynamicAnimator: UIDynamicAnimator!
  
  override init() {
    super.init()
    
    itemSize = CGSize(width: 30, height: 30)
    minimumInteritemSpacing = 10
    minimumLineSpacing = 10
    sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    
    dynamicAnimator = UIDynamicAnimator(collectionViewLayout: self)
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  override func shouldInvalidateLayoutForBoundsChange(newBounds: CGRect) -> Bool {
    let scrollView = collectionView
    let delta = newBounds.origin.y - scrollView!.bounds.origin.y
    
    let touchLocation = collectionView!.panGestureRecognizer.locationInView(self.collectionView)
    for behavior in dynamicAnimator.behaviors as! [UIAttachmentBehavior] {
      let yDistanceFromTouch = fabsf(Float(touchLocation.y - behavior.anchorPoint.y))
      let xDistanceFromTouch = fabsf(Float(touchLocation.x - behavior.anchorPoint.x))
      let scrollResistance = (yDistanceFromTouch + xDistanceFromTouch) / 1500
      
      let attribute = behavior.items.first!
      var center = attribute.center
      if (delta < 0) {
        center.y += CGFloat(max(Float(delta), Float(delta) * scrollResistance))
      }
      else {
        center.y += CGFloat(min(Float(delta), Float(delta) * scrollResistance))
      }
      
      attribute.center = center;
      dynamicAnimator.updateItemUsingCurrentState(attribute)
    }
    
    return false
  }
  
  override func collectionViewContentSize() -> CGSize {
    return super.collectionViewContentSize()
  }
  
  override func prepareLayout() {
    super.prepareLayout()
    let contentSize = self.collectionViewContentSize()
    let items = super.layoutAttributesForElementsInRect(CGRect(x: 0, y: 0, width: contentSize.width, height: contentSize.height))
    if dynamicAnimator.behaviors.count == 0 {
      for item in items! {
        let behavior = UIAttachmentBehavior(item: item, attachedToAnchor: item.center)
        behavior.length = 0.0
        behavior.damping = 2.0
        behavior.frequency = 1.5
        
        dynamicAnimator.addBehavior(behavior)
      }
    }
  }
  
  override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
    return (dynamicAnimator.itemsInRect(rect) as! [UICollectionViewLayoutAttributes])
  }
  
  override func layoutAttributesForItemAtIndexPath(indexPath: NSIndexPath) -> UICollectionViewLayoutAttributes? {
    return dynamicAnimator.layoutAttributesForCellAtIndexPath(indexPath)
  }
}
