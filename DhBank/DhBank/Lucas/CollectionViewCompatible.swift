//
//  CollectionViewCompatible.swift
//  DhBank
//
//  Created by Lucas on 21/10/21.
//

import UIKit

protocol CollectionViewCompatible {

    var reuseIdentifier: String { get }
    
    func cellForCollectionView(collectionView: UICollectionView, atIndexPath indexPath: IndexPath) -> UICollectionViewCell
    
}
