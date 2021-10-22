//
//  CelulaComXibModelCell.swift
//  Exemplo_Xib_2
//
//  Created by Lucas on 21/10/21.
//

import UIKit

class CelulaComXibModelCell: UITableViewCell {
    
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var nomeLabel2: UILabel!
    
    func setupValues( imagem1: String, nomeLabel2: String ) {
        self.nomeLabel2.text = nomeLabel2
        self.image1.image = UIImage(named: imagem1)
    }
    
}
