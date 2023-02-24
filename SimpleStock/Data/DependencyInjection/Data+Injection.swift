//
//  Data+Injection.swift
//  SimpleStock
//
//  Created by Jose Harold on 22/02/2023.
//

import Resolver

extension Resolver {
    
    @MainActor
    public static func registerDataServices() {
        
        register { ProductRemoteDataSource() as ProductRemoteDataSourceProtocol }
        register { ProductLocalDataSource() as ProductLocalDataSourceProtocol }
        register {
            ProductRespository(
                remoteDataSource: resolve(),
                localDataSource: resolve()
            )
            as ProductRespositoryProtocol
        }
    }
}


