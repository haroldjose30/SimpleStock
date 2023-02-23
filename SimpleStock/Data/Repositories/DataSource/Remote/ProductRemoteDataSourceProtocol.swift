//
//  ProductRemoteDataSourceProtocol.swift
//  SimpleStock
//
//  Created by Jose Harold on 22/02/2023.
//

protocol ProductRemoteDataSourceProtocol {
    
    func getProducts(
        limit: Int,
        skip: Int
    ) async throws -> ProductsRemoteResponse
}
