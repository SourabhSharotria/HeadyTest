//
//  CategoryTableViewCell.swift
//  MachineTest
//
//  Created by Sourabh Sharotria on 20/05/18.
//  Copyright © 2018 mac min . All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {

    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    var varietyArray = [ProductVariantDataModel]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    private func registerCell(){
    }
    
    func updateCellData(header:String, varients: [ProductVariantDataModel]?) {
        self.headerLabel.text = header
        self.varietyArray = varients!
        self.registerCell()
        DispatchQueue.main.async {
            self.categoryCollectionView.reloadData()
        }
    }
}
