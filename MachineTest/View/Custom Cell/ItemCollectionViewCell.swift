//
//  ItemCollectionViewCell.swift
//  MachineTest
//
//  Created by Sourabh Sharotri on 25/04/18.
//  Copyright © 2018 mac min . All rights reserved.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!

    func updateCellData(varients: ProductVariantDataModel) {
        self.colorLabel.text = "Color: \(varients.color ?? "")"
        self.sizeLabel.text = "Size: \(varients.size ?? Int(0.0))"
        self.priceLabel.text = "Price: \(varients.price ?? Int(0.0))"
    }
}
