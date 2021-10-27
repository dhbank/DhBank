//
//  SelectedRecipeCollectionViewModelCell.swift
//  DhBank
//
//  Created by Lucas on 21/10/21.
//

import UIKit

class SelectedRecipeCollectionViewModelCell: UICollectionViewCell {

    @IBOutlet weak var labelTituloReceita: UILabel!
    @IBOutlet weak var labelImagemReceita: UILabel!
    @IBOutlet weak var viewCardReceita: UIView!
    @IBOutlet weak var viewCurtidas: UIView!
    @IBOutlet weak var imagemCurtidas: UIImageView!
    @IBOutlet weak var imagemDetalhes: UIImageView!


    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupDesing(tituloReceita: String, imagemReceita: String){
        labelTituloReceita.text = tituloReceita
        labelImagemReceita.text = imagemReceita
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
