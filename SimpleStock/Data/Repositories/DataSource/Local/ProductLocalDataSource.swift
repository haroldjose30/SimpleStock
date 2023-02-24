//
//  ProductLocalDataSource.swift
//  SimpleStock
//
//  Created by Jose Harold on 22/02/2023.
//

import RealmSwift

@MainActor
class ProductLocalDataSource: ProductLocalDataSourceProtocol {
    
    let realm = try! Realm()
    
    func getProducts(
        limit: Int,
        skip: Int
    ) async throws -> ProductsLocalHeader? {
        
        let products = realm.objects(ProductsLocalHeader.self)
        let product = products.first {
            $0.limit == limit &&
            $0.skip == skip
        }
        
        return product
    }
    
    func add(
        products: ProductsLocalHeader
    ) async throws {
        
        try await delete(
            limit: products.limit,
            skip: products.skip
        )
        
        try realm.write {
            realm.add(products)
        }
    }
    
    func delete(
        limit: Int,
        skip: Int
    ) async throws {
        
        guard let products = try await getProducts(
            limit: limit,
            skip: skip
        ) else {
            return
        }
        
        try realm.write {
            realm.delete(products)
        }
    }
}
