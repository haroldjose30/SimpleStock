//
//  ProductRespositoryTest.swift
//  SimpleStockTests
//
//  Created by Jose Harold on 22/02/2023.
//

import XCTest
@testable import SimpleStock

final class ProductRespositoryTest: XCTestCase {
    
    private var repository: ProductRespositoryProtocol!
    private var remoteDataSource: SpyProductRemoteDataSource!
    private var localDataSource: SpyProductLocalDataSource!
    
    override func setUpWithError() throws {
        
        remoteDataSource = SpyProductRemoteDataSource()
        localDataSource = SpyProductLocalDataSource()
        repository = ProductRespository(
            remoteDataSource: remoteDataSource,
            localDataSource: localDataSource
        )
    }

    override func tearDownWithError() throws {
        
        repository = nil
        remoteDataSource = nil
        localDataSource = nil
    }

    func test_getProducts_WhenLocalDataSourceIsEmpty_ShouldCallRemoteDataSource_ReturnProducts() async throws {
        
        //arrange
        let limit = 2
        let skip = 0
        let expectedCount = limit
        
        remoteDataSource.getProductToReturn = ProductsRemoteResponse(
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
        
        //act
        let response = try? await repository.getProducts(
            limit: limit,
            skip: skip
        )
        
        //assert
        guard let response = response else {
            XCTFail("response should return value")
            return
        }
        
        XCTAssertTrue(remoteDataSource.getProductsCalled)
        XCTAssertEqual(response.count, expectedCount)
    }
}
