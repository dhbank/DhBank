//
//  CelulaComXibModel.swift
//  Exemplo_Xib_2
//
//  Created by Lucas on 21/10/21.
//

import UIKit

class CelulaComXibModel : TableViewCompatible {
    internal init(nomeLabel1: String, nomeLabel2: String) {
        self.nomeLabel1 = nomeLabel1
        self.nomeLabel2 = nomeLabel2
    }
    
    

    var reuseIdentifier: String {
        return "CelulaComXibModelCellIdentifier"
    }
    
    var nomeLabel1: String
    var nomeLabel2: String

    func cellForTableView(tableView: UITableView, atIndexPath indexPath: IndexPath) -> UITableViewCell {
       if let cell = tableView.dequeueReusableCell(withIdentifier: self.reuseIdentifier, for: indexPath) as? CelulaComXibModelCell {
        
        cell.setupValues(nomeLabel1: nomeLabel1, nomeLabel2: nomeLabel2)
            
        return cell
        
    } else {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.reuseIdentifier, for: indexPath)
        
        return cell
        }
    }
}
