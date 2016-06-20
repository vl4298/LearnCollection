//
//  DLCollectionViewStackLayout.swift
//  DLCollectionView
//
//  Created by Dinh Luu on 17/06/2016.
//  Copyright © 2016 Dinh Luu. All rights reserved.
//

import UIKit

class DLCollectionViewStackLayout: UICollectionViewLayout {
  
  var numberOfStackAcross: CGFloat = 0
  var numberOfStack = 0, numberOfStackRow: Float = 0
  let stackInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
  var pageSize: CGSize!
  let stackSize = CGSize(width: 80, height: 80)
  let itemSize: CGFloat = 80.0
  let minimumInterStackSpacing: CGFloat = 10.0, minimumLineSpacing: CGFloat = 5.0
  var stackFrames: [CGRect]!
  let stackFooterGap: CGFloat = 10, stackFooterHeight: CGFloat = 10
  var contentSize: CGSize = CGSize(width: 0, height: 0)
  let visibleItemPerStack = 3
  
  override func prepareLayout() {
    super.prepareLayout()
    prepareStackLayout()
  }
  
  internal func prepareStackLayout() {
    numberOfStack = collectionView!.numberOfSections()
    pageSize = collectionView!.bounds.size
    
    let availableWidth = pageSize.width - (stackInsets.left + stackInsets.right)
    numberOfStackAcross = (availableWidth + minimumInterStackSpacing) / (stackSize.width + minimumInterStackSpacing)
    
    let spacing = (availableWidth - (numberOfStackAcross * stackSize.width) / (numberOfStackAcross - 1))
    numberOfStackRow = ceilf(Float(numberOfStack) / Float(numberOfStackAcross))
    stackFrames = [CGRect]()
    var stackColumn = 0
    var stackRow = 0
    var left = stackInsets.left
    var top = stackInsets.top
    
    for _ in 0..<numberOfStack {
      let stackFrame = CGRect(origin: CGPoint(x: left, y: top), size: stackSize)
      stackFrames.append(stackFrame)
      
      left = stackSize.width + spacing
      stackColumn += 1
      
      if stackColumn >= Int(numberOfStackAcross) {
        left = stackInsets.left
        top += self.stackSize.height + stackFooterGap +
          stackFooterHeight + self.minimumLineSpacing;
        stackColumn = 0
        stackRow += 1
      }
      
      let sub1 = CGFloat(numberOfStackRow) * (stackSize.height + stackFooterGap + stackFooterHeight)
      let sub2 = CGFloat(numberOfStackRow - 1) * minimumLineSpacing
      let maxheight = max(self.pageSize.height, stackInsets.top + sub1 + sub2 + stackInsets.bottom)
      contentSize = CGSize(width: pageSize.width, height: maxheight)
    }
  }
  
  override func collectionViewContentSize() -> CGSize {
    return contentSize
  }
  
  override func layoutAttributesForItemAtIndexPath(indexPath: NSIndexPath) -> UICollectionViewLayoutAttributes? {
    let stackFrame = stackFrames[indexPath.section]
    let attribute = DLStackColllectionViewLayoutAttribute(forCellWithIndexPath: indexPath)
    attribute.size = CGSize(width: itemSize, height: itemSize)
    attribute.center = CGPoint(x: CGRectGetMidX(stackFrame), y: CGRectGetMidY(stackFrame))
    var angle: Double = 0
    
    if indexPath.item == 1 {
      angle = 5
    } else {
      angle = -5
    }
    
    let rotateAngle = CGFloat(angle * M_PI / 180)
    attribute.transform3D = CATransform3DMakeRotation(rotateAngle, 0, 0, 1);
    attribute.alpha = indexPath.item >= visibleItemPerStack ? 0 : 1
    attribute.zIndex = indexPath.item >= visibleItemPerStack ? 0 : visibleItemPerStack - indexPath.item;
    attribute.hidden = indexPath.item >= visibleItemPerStack
    attribute.shadowOpacity = indexPath.item >= visibleItemPerStack ? 0 : 0.5
    
    return attribute
  }
  
  override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
    var attributes = [UICollectionViewLayoutAttributes]()
    for i in 0..<numberOfStack {
      var stackFrame = stackFrames[i]
      stackFrame.size.height += stackFooterGap + stackFooterHeight
      
      if CGRectIntersectsRect(stackFrame, rect) {
        let itemCount = collectionView!.numberOfItemsInSection(i)
        for j in 0..<itemCount {
          let indexPath = NSIndexPath(forItem: j, inSection: i)
          attributes.append(self.layoutAttributesForItemAtIndexPath(indexPath)!)
        }
      }
    }
    
    return attributes
  }

}
