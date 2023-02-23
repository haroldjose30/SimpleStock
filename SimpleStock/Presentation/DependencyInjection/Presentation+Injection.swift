//
//  Presentation+Injection.swift
//  SimpleStock
//
//  Created by Jose Harold on 22/02/2023.
//

import Resolver

extension Resolver {
    
    @MainActor
    public static func registerPresentationServices() {
        
        register {
            ProductListPageViewModel(
                getProductsUseCase: resolve()
            )
        }
    }
}
