//
//  ItemDataModel.swift
//  MachineTest
//
//  Created by Sourabh Sharotri on 25/04/18.
//  Copyright © 2018 mac min . All rights reserved.
//

import Foundation
struct InnerDataModel: CodableModel {
    typealias dataModel = InnerDataModel
    var categories: [CategoryDataModel]?
    var rankings: [RankingDataModel]?
}
struct CategoryDataModel: Codable {
    var id: Int?
    var name: String?
    var products: [ProductDataModel]?
    var childCategories: [String]?
}

struct RankingDataModel: Codable {
    var ranking: String?
    var products: [RankingProductsDataModel]?
}

struct RankingProductsDataModel: Codable {
    var id: Int?
    var view_count: Int64?
}

struct ProductDataModel: Codable {
    var id: Int?
    var name: String?
    var date_added: String?
    var variants: [ProductVariantDataModel]?
}

struct ProductVariantDataModel: Codable {
    var id: Int?
    var color: String?
    var size: Int?
    var price: Int?
}

