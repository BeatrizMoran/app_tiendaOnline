//
//  ProductModel.swift
//  App_OnlineShop
//
//  Created by  on 31/3/25.
//

import Foundation

struct Producto: Identifiable, Codable {
    var id: Int
    var title: String
    var price: Double
    var description: String
    var category: String
    var image: String
}

struct Rating: Codable {
    var rate: Double
    var count: Int
}

