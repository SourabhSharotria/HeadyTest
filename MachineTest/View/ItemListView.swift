//
//  ItemListView.swift
//  MachineTest
//
//  Created by Sourabh Sharotri  on 25/04/18.
//  Copyright © 2018 mac min . All rights reserved.
//

import UIKit
protocol ItemListViewDelegate:class {
    func itemListViewFetchProducts(_ view: ItemListView)
}

class ItemListView: UIView {
    
    @IBOutlet weak var itemsTableView: UITableView!
    
    fileprivate var refreshControl: UIRefreshControl!
    
    var categoriesArray = [CategoryDataModel]()
    var rankingArray = [RankingDataModel]()
    
    weak var delegate:ItemListViewDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(self.fetchProducts), for: .valueChanged)
        itemsTableView.addSubview(refreshControl)
    }
    
    @objc private func fetchProducts(){
        refreshControl.beginRefreshing()
        self.delegate?.itemListViewFetchProducts(self)
    }
    
    func updateItemList(data:InnerDataModel) {
        
        refreshControl.endRefreshing()
        
        categoriesArray.removeAll()
        rankingArray.removeAll()
        if data.categories != nil {
            categoriesArray.append(contentsOf: data.categories!)
        }
        
        if data.rankings != nil {
            rankingArray.append(contentsOf: data.rankings!)
        }
        
        DispatchQueue.main.async {
            self.itemsTableView.reloadData()
        }
    }
}
