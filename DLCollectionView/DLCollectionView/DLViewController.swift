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
  var circleLayout: DLCollectionViewFlowLayout! = nil
  var flowLayout: UICollectionViewFlowLayout! = nil
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setUpSegmentControl()
    addNavigationItem()
  }
  
  override func loadView() {
    super.loadView()
    circleLayout = DLCollectionViewFlowLayout()
    
    flowLayout = UICollectionViewFlowLayout()
    flowLayout.itemSize = CGSize(width: 140, height: 140)
    flowLayout.minimumLineSpacing = 10.0
    flowLayout.minimumInteritemSpacing = 10.0
    
    let photoCollectionView = UICollectionView(frame: view.bounds, collectionViewLayout: flowLayout)
    photoCollectionView.dataSource = self
    photoCollectionView.delegate = self
    
    photoCollectionView.registerClass(DLCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: cellIdentifier)
    photoCollectionView.allowsSelection = false
    photoCollectionView.indicatorStyle = UIScrollViewIndicatorStyle.White
    
    self.collectionView = photoCollectionView
    
    view.addSubview(collectionView)
  }
  
  private func addNavigationItem() {
    self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: #selector(self.addItem))
    self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Trash, target: self, action: #selector(self.deleteItem))
  }
  
  private func setUpSegmentControl() {
    layoutChangeSegmentControl = UISegmentedControl(items: ["Boring", "Cover Flow"])
    layoutChangeSegmentControl.selectedSegmentIndex = 0
    layoutChangeSegmentControl.addTarget(self, action: #selector(self.layoutChangeSegmentControlDidChange), forControlEvents: .ValueChanged)
    
    self.navigationItem.titleView = layoutChangeSegmentControl
  }
  
  @objc private func layoutChangeSegmentControlDidChange() {
    if layoutChangeSegmentControl.selectedSegmentIndex == 0 {
      flowLayout.invalidateLayout()
      collectionView.setCollectionViewLayout(flowLayout, animated: false)
    } else {
      circleLayout.invalidateLayout()
      collectionView.setCollectionViewLayout(circleLayout, animated: false)
    }
    
    self.collectionView.collectionViewLayout.invalidateLayout()
  }
  
  @objc private func addItem() {
    
  }
  
  @objc private func deleteItem() {
    
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
    if collectionViewLayout == flowLayout {
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
