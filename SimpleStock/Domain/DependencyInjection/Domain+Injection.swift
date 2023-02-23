//
//  Domain+Injection.swift
//  SimpleStock
//
//  Created by Jose Harold on 22/02/2023.
//

import Resolver

extension Resolver {
    
    public static func registerDomainServices() {
        
        register {
            GetProductsUseCase(
                repository: resolve()
            )
            as GetProductsUseCaseProtocol
        }
        
    }
}


