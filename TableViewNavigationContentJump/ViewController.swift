//
//  ViewController.swift
//  TableViewNavigationContentJump
//
//  Created by Tim Ekl on 2015.02.27.
//  Copyright (c) 2015 The Omni Group. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet private var boxHeightConstraint: NSLayoutConstraint?
    @IBOutlet private var boxHeightLabel: UILabel?
    
    var boxHeight: CGFloat? {
        get {
            return self.boxHeightConstraint?.constant
        }
        set(newHeight) {
            let realHeight = newHeight ?? 40
            self.boxHeightConstraint?.constant = realHeight
            self.boxHeightLabel?.text = "\(realHeight)"
        }
    }
}

class TableViewController: UITableViewController {
    
    private var heights: [CGFloat] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 48
        
        for i in 0..<30 {
            self.heights.append(CGFloat(30 + arc4random_uniform(20)))
        }
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.heights.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! TableViewCell
        cell.boxHeight = self.heights[indexPath.row]
        
        switch indexPath.row {
        case 0:
            cell.boxHeightLabel?.text = "Scroll all the way down"
        case self.heights.count - 1:
            cell.boxHeightLabel?.text = "Now select this row"
        default:
            break
        }
        
        return cell
    }

}

