//
//  CelulaComXibModelCell.swift
//  Exemplo_Xib_2
//
//  Created by Lucas on 21/10/21.
//

import UIKit

class CelulaComXibModelCell: UITableViewCell {
    
    @IBOutlet weak var nomeLabel1: UILabel!
    @IBOutlet weak var nomeLabel2: UILabel!
    @IBOutlet weak var linhaView: UIView!
    
    func setupValues( nomeLabel1: String, nomeLabel2: String ) {
        self.nomeLabel1.text = nomeLabel1
        self.nomeLabel2.text = nomeLabel2

    }
    
}
