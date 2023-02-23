//
//  GetProductsUseCaseProtocol.swift
//  SimpleStock
//
//  Created by Jose Harold on 22/02/2023.
//

protocol GetProductsUseCaseProtocol {
    
    func execute(
        limit: Int,
        skip: Int
    ) async throws -> [ProductModel]
}


