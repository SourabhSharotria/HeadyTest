//
//  ViewController.swift
//  MachineTest
//
//  Created by Sourabh Sharotri  on 25/04/18.
//  Copyright © 2018 mac min . All rights reserved.
//

import UIKit

class ItemListViewController: UIViewController {
    private var itemListView : ItemListView?
    private let serviceManger = ItemListViewControllerServiceManger()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        serviceManger.delegate = self
        itemListView = self.view as? ItemListView
        itemListView?.delegate = self
        self.getAllUserList()
    }

    private func getAllUserList() {
        serviceManger.getItemListData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ItemListViewController:ItemListViewDelegate {
    func itemListViewFetchProducts(_ view: ItemListView){
        self.getAllUserList()
    }
}

extension ItemListViewController: ItemListViewControllerServiceMangerDelegate{
    func itemListViewControllerServiceMangerDelegate(serviceManger: ItemListViewControllerServiceManger, didFetchingData data: InnerDataModel?) {
        if let innerData = data{
            self.itemListView?.updateItemList(data: innerData)
        }
    }
}

