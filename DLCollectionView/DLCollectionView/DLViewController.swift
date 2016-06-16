//
//  DLViewController.swift
//  DLCollectionView
//
//  Created by Dinh Luu on 16/06/2016.
//  Copyright © 2016 Dinh Luu. All rights reserved.
//

import UIKit

class DLViewController: UIViewController {
  
  let numItem = 30
  let cellIdentifier = "DLCell"
  var collectionView: UICollectionView! = nil
  var layoutChangeSegmentControl: UISegmentedControl! = nil
  var coverFlowCollectionViewLayout: DLCollectionViewFlowLayout! = nil
  var boringCollectionViewLayout: UICollectionViewFlowLayout! = nil
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    layoutChangeSegmentControl = UISegmentedControl(items: ["Boring", "Cover Flow"])
    layoutChangeSegmentControl.selectedSegmentIndex = 0
    layoutChangeSegmentControl.addTarget(self, action: #selector(self.layoutChangeSegmentControlDidChange), forControlEvents: .ValueChanged)
    
    self.navigationItem.titleView = layoutChangeSegmentControl
  }
  
  override func loadView() {
    coverFlowCollectionViewLayout = DLCollectionViewFlowLayout()
    
    boringCollectionViewLayout = UICollectionViewFlowLayout()
    boringCollectionViewLayout.itemSize = CGSize(width: 140, height: 140)
    boringCollectionViewLayout.minimumLineSpacing = 10.0
    boringCollectionViewLayout.minimumInteritemSpacing = 10.0
    
    let photoCollectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: boringCollectionViewLayout)
    photoCollectionView.dataSource = self
    photoCollectionView.delegate = self
    
    photoCollectionView.registerClass(DLCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: cellIdentifier)
    photoCollectionView.allowsSelection = false
    photoCollectionView.indicatorStyle = UIScrollViewIndicatorStyle.White
    
    self.collectionView = photoCollectionView
  }
  
  @objc private func layoutChangeSegmentControlDidChange() {
    if layoutChangeSegmentControl.selectedSegmentIndex == 0 {
      self.collectionView.setCollectionViewLayout(boringCollectionViewLayout, animated: false)
    } else {
      self.collectionView.setCollectionViewLayout(coverFlowCollectionViewLayout, animated: false)
    }
    
    self.collectionView.collectionViewLayout.invalidateLayout()
  }
}

extension DLViewController: UICollectionViewDataSource {
  func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return numItem
  }
  
  func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellIdentifier, forIndexPath: indexPath) as! DLCollectionViewCell
    cell.text = "\(arc4random() + 10000)"
    return cell
  }
}

extension DLViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
    if collectionViewLayout == boringCollectionViewLayout {
      return UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
    } else {
      if UIDeviceOrientationIsPortrait(UIDevice.currentDevice().orientation) {
        return UIEdgeInsets(top: 0, left: 70, bottom: 0, right: 70)
      } else {
        if CGRectGetHeight(UIScreen.mainScreen().bounds) > 480 {
          return UIEdgeInsets(top: 0, left: 190, bottom: 0, right: 190)
        } else {
          return UIEdgeInsets(top: 0, left: 150, bottom: 0, right: 150)
        }
      }
    }
  }
}
