//
//  ProductRespositoryProtocol.swift
//  SimpleStock
//
//  Created by Jose Harold on 22/02/2023.
//

protocol ProductRespositoryProtocol {
    
    func getProducts(
        limit: Int,
        skip: Int
    ) async throws -> [ProductDTO]
    
}
