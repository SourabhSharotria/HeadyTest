//
//  ItemDataModel.swift
//  MachineTest
//
//  Created by Sourabh Sharotri on 05/05/18.
//  Copyright © 2018 mac min . All rights reserved.


import Foundation
protocol CodableModel: Codable{
    associatedtype dataModel
    static func getDataModel(_ jsonData: Data) -> dataModel?
    func getJsonData() -> Data?
}

extension CodableModel{
    static func getDataModel(_ jsonData: Data) -> dataModel?{
        
        let jsonDecoder = JSONDecoder()
        if let apiResponse = try? jsonDecoder.decode(self, from: jsonData){
            if let apiData = apiResponse as? Self.dataModel{
                return apiData
            }
            else {
                if let jsonDict = try? JSONSerialization.jsonObject(with: jsonData, options: .allowFragments) as! NSDictionary{
                    print(jsonDict) //To see unexpected json data
                }
                
                return nil
            }
        }else{
            if let jsonDict = try? JSONSerialization.jsonObject(with: jsonData, options: .allowFragments) as! NSDictionary{
                print(jsonDict) //To see unexpected json data
            }
        }
        return nil
    }
    func getJsonData() -> Data? {
        let jsonEncoder = JSONEncoder()
        if let data = try? jsonEncoder.encode(self){
            return data
        }
        return nil
    }
}
