//
//  SelectedRecipeCollectionViewModelCell.swift
//  DhBank
//
//  Created by Lucas on 21/10/21.
//

import UIKit

class SelectedRecipeCollectionViewModelCell: UICollectionViewCell {

    @IBOutlet weak var labelTituloReceita: UILabel!
    @IBOutlet weak var viewCardReceita: UIView!
    @IBOutlet weak var viewCurtidas: UIView!
    @IBOutlet weak var imagemCurtidas: UIImageView!
    @IBOutlet weak var imagemDetalhes: UIImageView!

    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupDesing(tituloReceita: String){
        labelTituloReceita.text = tituloReceita
    }
    
    func selecionar() {
        imagemCurtidas.image = UIImage(systemName: "heart.fill")
        imagemCurtidas.tintColor = .red
    }
    
    func deselecionar() {
        imagemCurtidas.image = UIImage(systemName: "heart.fill")
        imagemCurtidas.tintColor = .red
    }

}
