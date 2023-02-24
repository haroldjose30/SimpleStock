//
//  ProductLocalDataSourceProtocol.swift
//  SimpleStock
//
//  Created by Jose Harold on 22/02/2023.
//

protocol ProductLocalDataSourceProtocol {
    
    func getProducts(
        limit: Int,
        skip: Int
    ) async throws -> ProductsLocalHeader?
    
    func add(
        products: ProductsLocalHeader
    ) async throws
    
    func delete(
        limit: Int,
        skip: Int
    ) async throws
}
