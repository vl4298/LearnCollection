//
//  DLCollectionView.swift
//  DLCollectionView
//
//  Created by Dinh Luu on 16/06/2016.
//  Copyright © 2016 Dinh Luu. All rights reserved.
//

import UIKit

class DLCollectionView: UICollectionView {

  convenience init(frame: CGRect) {
    let collectionLayout = DLCollectionViewFlowLayout()
    self.init(frame: frame, collectionViewLayout: collectionLayout)
  }
  
  override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
    super.init(frame: frame, collectionViewLayout: layout)
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
}
