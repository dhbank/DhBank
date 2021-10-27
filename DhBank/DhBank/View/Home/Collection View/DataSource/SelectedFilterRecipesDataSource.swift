//
//  SelectedFilterRecipesDataSource.swift
//  DhBank
//
//  Created by Lucas on 21/10/21.
//

import UIKit

class SelectedFilterRecipesDataSource: NSObject {
    
    let itemsPerRow: CGFloat = 2
    let sectionInserts = UIEdgeInsets(top: 25, left: 25, bottom: 25, right: 25)

    
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
        
        let paddingWidth = sectionInserts.left * ( itemsPerRow + 1 )
        let availableWidth = collectionView.frame.width - paddingWidth
        let widthPerItem = availableWidth / itemsPerRow
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInserts
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInserts.left
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInserts.left
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

