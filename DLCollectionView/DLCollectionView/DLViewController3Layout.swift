
//
//  DLViewController3Layout.swift
//  DLCollectionView
//
//  Created by Dinh Luu on 17/06/2016.
//  Copyright © 2016 Dinh Luu. All rights reserved.
//

import UIKit

class DLViewController3Layout: UIViewController {
  
  var collectionView: UICollectionView!
  var stackLayout: DLCollectionViewStackLayout!
  var flowLayout: DLCollectionViewFlowLayout1!
  var slideLayout: DLCollectionViewSlideLayout!
  
  var numberOfSection = 3
  var numberItemPerSection = 20
  var section1 = [UIColor]()
  var section2 = [UIColor]()
  var section3 = [UIColor]()
  
  let cellIdentifier = "DLCell"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    initDatasource()
  }
  
  override func loadView() {
    super.loadView()
    
    stackLayout = DLCollectionViewStackLayout()
    flowLayout = DLCollectionViewFlowLayout1()
    slideLayout = DLCollectionViewSlideLayout()
    
    collectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: stackLayout)
    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
    
    collectionView.registerClass(DLColorCollectionViewCell.self, forCellWithReuseIdentifier: cellIdentifier)
    
    view.addSubview(collectionView)
  }
  
  private func initDatasource() {
    for _ in 0..<20 {
      let color1 = (arc4random() + 255) / 255
      let color2 = (arc4random() + 255) / 255
      let color3 = (arc4random() + 255) / 255
      section1.append(UIColor(red: CGFloat(color1), green: CGFloat(color2), blue: CGFloat(color3), alpha: 1.0))
    }
    
    for _ in 0..<20 {
      let color1 = (arc4random() + 255) / 255
      let color2 = (arc4random() + 255) / 255
      let color3 = (arc4random() + 255) / 255
      section2.append(UIColor(red: CGFloat(color1), green: CGFloat(color2), blue: CGFloat(color3), alpha: 1.0))
    }
    
    for _ in 0..<20 {
      let color1 = (arc4random() + 255) / 255
      let color2 = (arc4random() + 255) / 255
      let color3 = (arc4random() + 255) / 255
      section3.append(UIColor(red: CGFloat(color1), green: CGFloat(color2), blue: CGFloat(color3), alpha: 1.0))
    }
  }
  
}

extension DLViewController3Layout: UICollectionViewDataSource {
  func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
    return numberOfSection
  }
  
  func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return numberItemPerSection
  }
  
  func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellIdentifier, forIndexPath: indexPath) as! DLColorCollectionViewCell
    var array: [UIColor]!
    
    switch indexPath.section {
    case 0:
      array = section1
    case 1:
      array = section2
    default:
      array = section3
    }
    
    cell.setColor(array[indexPath.item])
    return cell
  }
}

extension DLViewController3Layout: UICollectionViewDelegate {
  
}
