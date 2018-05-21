//
//  ItemListView.swift
//  MachineTest
//
//  Created by Sourabh Sharotri  on 25/04/18.
//  Copyright © 2018 mac min . All rights reserved.
//

import UIKit

extension CategoryTableViewCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (varietyArray.count)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell1", for: indexPath) as! ItemCollectionViewCell
        cell.updateCellData(varients: varietyArray[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.size.height)-14
        return CGSize.init(width: width, height: width)
    }
    
}
