//
//  ViewController.swift
//  TestTableView
//
//  Created by Dinh Luu on 17/06/2016.
//  Copyright © 2016 Dinh Luu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  let kTableHeaderheight: CGFloat = 80
  var headerView: UIView!

  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.dataSource = self
    tableView.delegate = self
    
//    headerView = tableView.tableHeaderView!
//    tableView.tableHeaderView = nil
//    tableView.addSubview(headerView)
//    
//    tableView.contentInset = UIEdgeInsets(top: kTableHeaderheight, left: 0, bottom: 0, right: 0)
//    tableView.contentOffset = CGPoint(x: 0, y: -kTableHeaderheight)
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func updateHeaderView() {
    var headerRect = CGRect(x: 0, y: -kTableHeaderheight, width: tableView.bounds.width, height: kTableHeaderheight)
    if tableView.contentOffset.y < -kTableHeaderheight {
      print(tableView.contentOffset.y)
      headerRect.origin.y = tableView.contentOffset.y
      headerRect.size.height = -tableView.contentOffset.y
    }
    
    headerView.frame = headerRect
  }
  
  @IBAction func plusInset() {
    tableView.contentInset.top += 10
  }
  
  @IBAction func minInset() {
    tableView.contentInset.top -= 10
  }
  
  @IBAction func plusoffset() {
    tableView.contentOffset.y += 10
  }
  
  @IBAction func minoffset() {
    tableView.contentOffset.y -= 10
  }


}

extension ViewController: UITableViewDataSource {
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 20
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("cell")
    cell?.textLabel?.text = "\(indexPath.row)"
    return cell!
  }
}

extension ViewController: UITableViewDelegate {
  func scrollViewDidScroll(scrollView: UIScrollView) {
    //updateHeaderView()
  }
}

