//
//  DLDynamicViewController.swift
//  DLCollectionView
//
//  Created by Dinh Luu on 20/06/2016.
//  Copyright © 2016 Dinh Luu. All rights reserved.
//

import UIKit

class DLDynamicViewController: UIViewController {

  var collectionView: UICollectionView!
  var flowLayout: DLDynamicCollectionViewFlowLayout!
  let cellIdentifier = "CellIdentifier"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    flowLayout = DLDynamicCollectionViewFlowLayout()
    collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: flowLayout)
    collectionView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: cellIdentifier)
    
    collectionView.dataSource = self
    //collectionView.backgroundColor = UIColor.lightTextColor()
    view.addSubview(collectionView)
  }
  
  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
    flowLayout.invalidateLayout()
  }
}

extension DLDynamicViewController: UICollectionViewDataSource {
  func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
    return 1
  }
  
  func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 100
  }
  
  func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellIdentifier, forIndexPath: indexPath)
    cell.backgroundColor = UIColor.orangeColor()
    return cell
  }
}
