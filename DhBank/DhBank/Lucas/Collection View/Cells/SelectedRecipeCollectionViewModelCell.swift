//
//  SelectedRecipeCollectionViewModelCell.swift
//  DhBank
//
//  Created by Lucas on 21/10/21.
//

import UIKit

class SelectedRecipeCollectionViewModelCell: UICollectionViewCell {

    @IBOutlet weak var labelTituloReceita: UILabel!
    @IBOutlet weak var imageViewReceita: UIImageView!
    @IBOutlet weak var viewCardReceita: UIView!
    @IBOutlet weak var viewCurtidas: UIView!
    @IBOutlet weak var imagemCurtidas: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupDesing(tituloReceita: String, imagemReceita: String){
        labelTituloReceita.text = tituloReceita
        imageViewReceita.image = UIImage(named: imagemReceita)
    }
    
    func selecionar() {
        imagemCurtidas.image = UIImage(systemName: "heart.fill")
        imagemCurtidas.tintColor = .red
    }
    
    func deselecionar() {
        imagemCurtidas.image = UIImage(systemName: "heart")
        imagemCurtidas.tintColor = .lightGray
    }

}
