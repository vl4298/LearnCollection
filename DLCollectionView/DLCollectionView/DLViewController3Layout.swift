
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
  
  var numberOfSection = 5
  var numberItemPerSection = 20
  var section1 = [UIColor]()
  var section2 = [UIColor]()
  var section3 = [UIColor]()
  var section4 = [UIColor]()
  var section5 = [UIColor]()
  
  let cellIdentifier = "DLCell"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    initDatasource()
    
    stackLayout = DLCollectionViewStackLayout()
    flowLayout = DLCollectionViewFlowLayout1()
    slideLayout = DLCollectionViewSlideLayout()
    
    collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: stackLayout)
    //collectionView.delegate = self
    collectionView.dataSource = self
    //collectionView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
    
    collectionView.registerClass(DLColorCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: cellIdentifier)
    
    view.addSubview(collectionView)
  }
  
  override func loadView() {
    super.loadView()
    
    
  }
  
  private func initDatasource() {
    for _ in 0..<20 {
      let color1: CGFloat = CGFloat(arc4random_uniform(255) + 1) / 255
      let color2: CGFloat = CGFloat(arc4random_uniform(255) + 1) / 255
      let color3 : CGFloat = CGFloat(arc4random_uniform(255) + 1) / 255
      section1.append(UIColor(red: color1, green: color2, blue: color3, alpha: 1.0))
    }
    
    for _ in 0..<20 {
      let color1: CGFloat = CGFloat(arc4random_uniform(255) + 1) / 255
      let color2: CGFloat = CGFloat(arc4random_uniform(255) + 1) / 255
      let color3 : CGFloat = CGFloat(arc4random_uniform(255) + 1) / 255
      section2.append(UIColor(red: color1, green: color2, blue: color3, alpha: 1.0))
    }
    
    for _ in 0..<20 {
      let color1: CGFloat = CGFloat(arc4random_uniform(255) + 1) / 255
      let color2: CGFloat = CGFloat(arc4random_uniform(255) + 1) / 255
      let color3 : CGFloat = CGFloat(arc4random_uniform(255) + 1) / 255
      section3.append(UIColor(red: color1, green: color2, blue: color3, alpha: 1.0))
    }
    
    for _ in 0..<20 {
      let color1: CGFloat = CGFloat(arc4random_uniform(255) + 1) / 255
      let color2: CGFloat = CGFloat(arc4random_uniform(255) + 1) / 255
      let color3 : CGFloat = CGFloat(arc4random_uniform(255) + 1) / 255
      section4.append(UIColor(red: color1, green: color2, blue: color3, alpha: 1.0))
    }
    
    for _ in 0..<20 {
      let color1: CGFloat = CGFloat(arc4random_uniform(255) + 1) / 255
      let color2: CGFloat = CGFloat(arc4random_uniform(255) + 1) / 255
      let color3 : CGFloat = CGFloat(arc4random_uniform(255) + 1) / 255
      section5.append(UIColor(red: color1, green: color2, blue: color3, alpha: 1.0))
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
    case 2:
      array = section3
    case 3:
      array = section4
    default:
      array = section5
    }
    
    cell.setColor(array[indexPath.item])
    return cell
  }
}

extension DLViewController3Layout: UICollectionViewDelegate {
  
}
