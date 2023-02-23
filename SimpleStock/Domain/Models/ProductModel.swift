//
//  ProductModel.swift
//  SimpleStock
//
//  Created by Jose Harold on 22/02/2023.
//

struct ProductModel: Hashable {
    
    let id: Int
    let title: String
    let description: String
    let price: Int
    let discountPercentage: Double
    let rating: Double
    let stock: Int
    let brand: String
    let category: String
    let thumbnail: String
    let images: [String]
}

