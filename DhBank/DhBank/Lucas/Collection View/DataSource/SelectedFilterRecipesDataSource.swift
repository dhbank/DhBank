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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 128, height: 128)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15.0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5.0
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
