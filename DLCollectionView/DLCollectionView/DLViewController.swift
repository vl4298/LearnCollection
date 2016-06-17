//
//  DLViewController.swift
//  DLCollectionView
//
//  Created by Dinh Luu on 16/06/2016.
//  Copyright © 2016 Dinh Luu. All rights reserved.
//

import UIKit

class DLViewController: UIViewController {
  
  let numItem = 15
  let cellIdentifier = "DLCell"
  var collectionView: UICollectionView! = nil
  var layoutChangeSegmentControl: UISegmentedControl! = nil
  var circleLayout: DLCollectionViewLayout! = nil
  var flowLayout: UICollectionViewFlowLayout! = nil
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setUpSegmentControl()
    addNavigationItem()
  }
  
  override func loadView() {
    super.loadView()
    circleLayout = DLCollectionViewLayout()
    
    flowLayout = UICollectionViewFlowLayout()
    flowLayout.itemSize = CGSize(width: 50, height: 50)
    flowLayout.sectionInset = UIEdgeInsets(top: 13, left: 13, bottom: 13, right: 13)
    flowLayout.minimumLineSpacing = 13.0
    flowLayout.minimumInteritemSpacing = 13.0
    
    collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: circleLayout)
    collectionView.dataSource = self
    collectionView.delegate = self
    
    collectionView.registerClass(DLCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: cellIdentifier)
    collectionView.allowsSelection = false
    collectionView.indicatorStyle = UIScrollViewIndicatorStyle.White
    
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
    if collectionView.collectionViewLayout == circleLayout {
      flowLayout.invalidateLayout()
      collectionView.setCollectionViewLayout(flowLayout, animated: true)
    } else {
      circleLayout.invalidateLayout()
      collectionView.setCollectionViewLayout(circleLayout, animated: true)
    }
    
    //self.collectionView.collectionViewLayout.invalidateLayout()
  }
  
  @objc private func addItem() {
    
  }
  
  @objc private func deleteItem() {
    
  }
  
  override func shouldAutorotate() -> Bool {
    return true
  }
  
  override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
    return UIInterfaceOrientationMask.All
  }

}

extension DLViewController: UICollectionViewDataSource {
  func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return numItem
  }
  
  func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellIdentifier, forIndexPath: indexPath) as! DLCollectionViewCell
    cell.text = "\(indexPath.item)"
    return cell
  }
}

extension DLViewController: UICollectionViewDelegateFlowLayout {
}
