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
        
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: "SelectedRecipeCollectionViewModelCell", bundle: Bundle.main), forCellWithReuseIdentifier: "SelectedRecipeCollectionViewModelCellIdentifier")
        
    }
    
}


extension SelectedFilterRecipesDataSource : UICollectionViewDataSource, UICollectionViewDelegate {
    
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
