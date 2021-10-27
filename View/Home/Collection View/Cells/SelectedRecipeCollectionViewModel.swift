//
//  SelectedRecipeCollectionViewModel.swift
//  DhBank
//
//  Created by Lucas on 21/10/21.
//

import UIKit

protocol SelectedRecipeCollectionViewModelCallBack: class {
    func acaoViewSelecionarViewCurtidas(imagemCurtidas: UIImageView, viewSelecionada: Bool, indexView: Int)
    func acaoViewDeselecionarViewCurtidas(imagemCurtidas: UIImageView, viewSelecionada: Bool, indexView: Int)
}

class SelectedRecipeCollectionViewModel : CollectionViewCompatible {
    
    internal init(delegate: SelectedRecipeCollectionViewModelCallBack?, tituloReceita: String, imagemReceita: String, viewSelecionada: Bool, indexView: Int) {
        self.delegate = delegate
        self.tituloReceita = tituloReceita
        self.imagemReceita = imagemReceita
        self.viewSelecionada = viewSelecionada
        self.indexView = indexView
    }
    
    weak open var delegate : SelectedRecipeCollectionViewModelCallBack?
    
    var reuseIdentifier: String {
        return "SelectedRecipeCollectionViewModelCellIdentifier"
    }
    
    var tituloReceita : String
    var imagemReceita : String
    var viewSelecionada : Bool
    var indexView : Int
        
    func cellForCollectionView(collectionView: UICollectionView, atIndexPath indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.reuseIdentifier, for: indexPath) as? SelectedRecipeCollectionViewModelCell {
            
            // Add drop shadow
            cell.layer.cornerRadius = 15.0
            cell.layer.borderWidth = 0.0
            cell.layer.shadowColor = UIColor.lightGray.cgColor
            cell.layer.shadowOffset = CGSize(width: 0, height: 3)
            cell.layer.shadowRadius = 3.0
            cell.layer.shadowOpacity = 0.6
            cell.layer.masksToBounds = false
            
            cell.setupDesing(tituloReceita: tituloReceita, imagemReceita: imagemReceita)
                        
            let myGestureFilter = MyTapGestureFiltros(target: self, action: #selector(acaoCliqueViewCurtidas))
            
            myGestureFilter.indexCell = indexPath
            myGestureFilter.imagem = cell.imagemCurtidas
             
            cell.viewCurtidas.addGestureRecognizer(myGestureFilter)
                        
            // Checks if like is selected and paints the like button:
            if viewSelecionada {
                cell.selecionar()
            } else {
                cell.deselecionar()
            }
            
            return cell
            
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.reuseIdentifier, for: indexPath)
            return cell
        }
        
    }
    
    
    @objc func acaoCliqueViewCurtidas(sender: MyTapGestureFiltros) {
        if sender.indexCell?.row != nil {
            if !viewSelecionada {
                viewSelecionada = true
                delegate?.acaoViewSelecionarViewCurtidas(imagemCurtidas: sender.imagem!, viewSelecionada: viewSelecionada, indexView: indexView)
            } else {
                viewSelecionada = false
                delegate?.acaoViewDeselecionarViewCurtidas(imagemCurtidas: sender.imagem!, viewSelecionada: viewSelecionada, indexView: indexView)
            }
        }
    }
    
    class MyTapGestureFiltros: UITapGestureRecognizer {
        var indexCell: IndexPath?
        var imagem: UIImageView?
//        var viewSelecionada: Int = GlobalDesign.CURTIDA_SELECIONADA
    }
    
}
