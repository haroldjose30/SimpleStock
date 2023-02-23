//
//  ProductLocalRespository.swift
//  SimpleStock
//
//  Created by Jose Harold on 22/02/2023.
//

class ProductRespository: ProductRespositoryProtocol {
    
    private let remoteDataSource: ProductRemoteDataSourceProtocol
    private let localDataSource: ProductLocalDataSourceProtocol
    
    init(
        remoteDataSource: ProductRemoteDataSourceProtocol,
        localDataSource: ProductLocalDataSourceProtocol
    ) {
        
        self.remoteDataSource = remoteDataSource
        self.localDataSource = localDataSource
    }

    
    func getProducts(
        limit: Int,
        skip: Int
    ) async throws -> [ProductRemoteDTO] {
        
        
        //FIXME: Verify if exist data from local database
        
        
        //FIXME: if not exists local data get from Remote
        let remoteData = try? await remoteDataSource.getProducts(
            limit: limit,
            skip: skip
        )
        
        
        //FIXME: save remote data on local
        
        
        //FIXME: Return data
        
        return remoteData?.products ?? []
    }
}
