//
//  ProductsLocalResponse.swift
//  SimpleStock
//
//  Created by Jose Harold on 23/02/2023.
//

import Foundation
import RealmSwift


// MARK: - ProductsLocalHeader
class ProductsLocalHeader: Object {
    
    @Persisted var products: List<ProductLocalDTO>
    @Persisted var total: Int
    @Persisted var skip: Int
    @Persisted var limit: Int
    
    convenience init(
        products: List<ProductLocalDTO>,
        total: Int,
        skip: Int,
        limit: Int
    ) {
        self.init()
        
        self.products = products
        self.total = total
        self.skip = skip
        self.limit = limit
    }
}

// MARK: - ProductLocalDTO
class ProductLocalDTO: Object {
    
    @Persisted var id: Int
    @Persisted var title: String
    @Persisted var descr: String
    @Persisted var price: Int
    @Persisted var discountPercentage: Double
    @Persisted var rating: Double
    @Persisted var stock: Int
    @Persisted var brand: String
    @Persisted var category: String
    @Persisted var thumbnail: String
    @Persisted var images: List<String>

    convenience init(
        id: Int,
        title: String,
        descr: String,
        price: Int,
        discountPercentage: Double,
        rating: Double,
        stock: Int,
        brand: String,
        category: String,
        thumbnail: String,
        images: List<String>
    ) {
        
        self.init()
        
        self.id = id
        self.title = title
        self.descr = descr
        self.price = price
        self.discountPercentage = discountPercentage
        self.rating = rating
        self.stock = stock
        self.brand = brand
        self.category = category
        self.thumbnail = thumbnail
        self.images = images
    }
}
