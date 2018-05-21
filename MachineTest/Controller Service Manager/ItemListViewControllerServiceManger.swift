//
//  ItemListViewControllerServiceManger.swift
//  MachineTest
//
//  Created by Sourabh Sharotri  on 25/04/18.
//  Copyright © 2018 mac min . All rights reserved.
//

import Foundation
import UIKit
import CoreData

protocol ItemListViewControllerServiceMangerDelegate : class{
    func itemListViewControllerServiceMangerDelegate(serviceManger: ItemListViewControllerServiceManger, didFetchingData data: InnerDataModel?)
}

class ItemListViewControllerServiceManger {
    weak var delegate: ItemListViewControllerServiceMangerDelegate?
    
    func getItemListData(){
        self.fetchPreviousData()
        NetworkUtility.shareInstance.callData(requestType: .get, jsonInputData: nil, path: "") { (responseData) in
            
            self.saveJsonData(apiResponse: responseData as NSData)
            DispatchQueue.main.async {
                self.fetchPreviousData()
            }
        }
    }
    
    private func saveJsonData(apiResponse:NSData) {
        DispatchQueue.main.async {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            
            let entity = NSEntityDescription.entity(forEntityName: "DBProducts", in: context)
            let productData = NSManagedObject(entity: entity!, insertInto: context)
            productData.setValue(apiResponse, forKey: "productData")
            
            do {
                try context.save()
            } catch {
                print("Failed saving")
            }
            
            
        }
    }
    
    private func fetchPreviousData(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "DBProducts")
        
        do {
            let responseData = try context.fetch(request)
            guard responseData.count > 0 else {
                return
            }
            guard let data = (responseData[0] as! NSManagedObject).value(forKey: "productData") as? Data else {
                Helper.showAlert(title: "Error", subtitle: "Unable To Parse Data")
                return
            }
            
            guard let apiResponse = InnerDataModel.getDataModel(data) else {
                Helper.showAlert(title: "Error", subtitle: "Unable To Parse Data")
                return
            }
            self.delegate?.itemListViewControllerServiceMangerDelegate(serviceManger: self, didFetchingData: apiResponse)
            
        } catch {
            
            print("Failed")
        }
    }
}

