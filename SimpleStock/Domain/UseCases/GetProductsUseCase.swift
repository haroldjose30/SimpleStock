//
//  GetProductsUseCase.swift
//  SimpleStock
//
//  Created by Jose Harold on 22/02/2023.
//

final class GetProductsUseCase: GetProductsUseCaseProtocol {
    
    private var repository: ProductRespositoryProtocol
    
    init(
        repository: ProductRespositoryProtocol
    ) {
        self.repository = repository
    }
    
    func execute(
        limit: Int,
        skip: Int
    ) async throws -> [ProductModel] {
        
        try await repository.getProducts(
            limit: limit,
            skip: skip
        ).map({ $0.mapToModel() })
    }
}
