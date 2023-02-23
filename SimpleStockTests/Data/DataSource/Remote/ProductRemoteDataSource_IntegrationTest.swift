//
//  ProductRemoteDataSourceTest.swift
//  SimpleStockTests
//
//  Created by Jose Harold on 22/02/2023.
//

import XCTest
@testable import SimpleStock

final class ProductRemoteDataSource_IntegrationTest: XCTestCase {

    
    private var dataSource: ProductRemoteDataSourceProtocol!
    
    override func setUpWithError() throws {
       
        dataSource = ProductRemoteDataSource()
    }

    override func tearDownWithError() throws {
       
        dataSource = nil
    }

    func testgetProducts_WhenLimitIs10_ShouldReturn10Products() async throws {
       
        //arrange
        let limit = 10
        let skip = 0
        let expectedCount = limit
        
        //act
        let response = try? await dataSource.getProducts(
            limit: limit,
            skip: skip
        )
        
        //assert
        guard let response = response else {
            XCTFail("response should return value")
            return
        }
        
        XCTAssertEqual(response.products.count, expectedCount)
    }
}
