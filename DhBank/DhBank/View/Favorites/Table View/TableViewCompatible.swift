//
//  TableViewCompatible.swift
//  Thiago_Xib
//
//  Created by Lucas on 16/10/21.
//

import UIKit


protocol TableViewCompatible {

    var reuseIdentifier: String { get }
    
    func cellForTableView(tableView: UITableView, atIndexPath indexPath: IndexPath) -> UITableViewCell
    
}
