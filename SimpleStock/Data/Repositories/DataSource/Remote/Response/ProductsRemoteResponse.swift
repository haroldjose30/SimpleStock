//
//  ProductsRemoteDTO.swift
//  SimpleStock
//
//  Created by Jose Harold on 22/02/2023.
//

import Foundation


// MARK: - ProductsRemoteResponse
struct ProductsRemoteResponse: Codable {
    let products: [ProductRemoteDTO]
    let total: Int
    let skip: Int
    let limit: Int
    
    enum CodingKeys: String, CodingKey {
        case products = "products"
        case total = "total"
        case skip = "skip"
        case limit = "limit"
    }
}

// MARK: - ProductRemoteDTO
struct ProductRemoteDTO: Codable {
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
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case description = "description"
        case price = "price"
        case discountPercentage = "discountPercentage"
        case rating = "rating"
        case stock = "stock"
        case brand = "brand"
        case category = "category"
        case thumbnail = "thumbnail"
        case images = "images"
    }
}
