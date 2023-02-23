//
//  SpyProductRemoteDataSource.swift
//  SimpleStockTests
//
//  Created by Jose Harold on 22/02/2023.
//

@testable import SimpleStock

class SpyProductRemoteDataSource: ProductRemoteDataSourceProtocol {
    
    private(set) var getProductsCalled = false
    var getProductToReturn = ProductsRemoteResponse(
        products: [
            ProductRemoteDTO.fixture(
                id: 1,
                title: "fakeTitle1"
            ),
            ProductRemoteDTO.fixture(
                id: 2,
                title: "fakeTitle2"
            ),
        ],
        total: 100,
        skip: 0,
        limit: 30
    )
    
    func getProducts(
        limit: Int,
        skip: Int
    ) async throws -> ProductsRemoteResponse {
        
        getProductsCalled = true
        return getProductToReturn
    }
}

