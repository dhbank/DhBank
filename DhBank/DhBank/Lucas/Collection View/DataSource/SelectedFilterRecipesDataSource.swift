//
//  SelectedFilterRecipesDataSource.swift
//  DhBank
//
//  Created by Lucas on 21/10/21.
//

import UIKit

class SelectedFilterRecipesDataSource: NSObject {
    
    var data = [Any]()
    
    func initializeCollectionView(collectionView : UICollectionView){
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "SelectedRecipeCollectionViewModelCell", bundle: Bundle.main), forCellWithReuseIdentifier: "SelectedRecipeCollectionViewModelCellIdentifier")
        
    }
    
}


extension SelectedFilterRecipesDataSource : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    // itens por linha e margins entre linhas e colunas
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemsPerRow: CGFloat = 2
        let paddingWidth = 20 * ( itemsPerRow + 1 )
        let availableWidth = collectionView.frame.width - paddingWidth
        let widthPerItem = availableWidth / itemsPerRow
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 45, left: 20, bottom: 5, right: 20)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let selectedRecipeCollectionCelula = data[indexPath.row] as? SelectedRecipeCollectionViewModel {
            return selectedRecipeCollectionCelula.cellForCollectionView(collectionView: collectionView, atIndexPath: indexPath)
        } else {
            return UICollectionViewCell()
        }
        
    }
    
}
