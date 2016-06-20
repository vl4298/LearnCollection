//
//  DLCollectionViewFlowLayout1.swift
//  DLCollectionView
//
//  Created by Dinh Luu on 17/06/2016.
//  Copyright © 2016 Dinh Luu. All rights reserved.
//

import UIKit

class DLCollectionViewFlowLayout1: UICollectionViewFlowLayout {

  override init() {
    super.init()
    itemSize = CGSize(width: 80, height: 80)
    minimumLineSpacing = 10.0
    minimumInteritemSpacing = 0
    sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
}
