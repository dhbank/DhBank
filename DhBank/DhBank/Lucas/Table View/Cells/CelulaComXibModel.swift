//
//  CelulaComXibModel.swift
//  Exemplo_Xib_2
//
//  Created by Lucas on 21/10/21.
//

import UIKit

class CelulaComXibModel : TableViewCompatible {
    internal init(nomeImage: String, nomeLabel2: String) {
        self.nomeImage = nomeImage
        self.nomeLabel2 = nomeLabel2
    }

    var reuseIdentifier: String {
        return "CelulaComXibModelCellIdentifier"
    }
    
    var nomeImage: String
    var nomeLabel2: String

    func cellForTableView(tableView: UITableView, atIndexPath indexPath: IndexPath) -> UITableViewCell {
       if let cell = tableView.dequeueReusableCell(withIdentifier: self.reuseIdentifier, for: indexPath) as? CelulaComXibModelCell {
        
        cell.setupValues(imagem1: nomeImage, nomeLabel2: nomeLabel2)
            
        return cell
        
    } else {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.reuseIdentifier, for: indexPath)
        
        return cell
        }
    }
}
