//
//  ItemListView+TableView.swift
//  MachineTest
//
//  Created by Sourabh Sharotria on 20/05/18.
//  Copyright © 2018 mac min . All rights reserved.
//

import UIKit

extension ItemListView: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return rankingArray.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (rankingArray[section].products?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CategoryTableViewCell
        
        cell.selectionStyle = .none
        
        let selectedID = rankingArray[indexPath.section].products![indexPath.row].id
        
        _ = categoriesArray.filter { (categotyObj) -> Bool in
            
            _ = categotyObj.products?.filter({ (productModel) -> Bool in
                
                if productModel.id == selectedID {
                    cell.updateCellData(header: productModel.name!, varients: productModel.variants)
                }
                
                return true
            })
            return true
        }
        
        
//        let varientArray = category.
//        let varientArray = categoriesArray.map({$0.id == selectedID})
//        let varientArray = categoriesArray[indexPath.section].products![indexPath.row].variants
//        let headerText = categoriesArray[indexPath.section].products![indexPath.row].name
        
//        cell.updateCellData(header: headerText!, varients: varientArray)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 30))
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 30))
        
        label.text = rankingArray[section].ranking
        view.addSubview(label)
        view.backgroundColor = UIColor.gray
        
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
}
