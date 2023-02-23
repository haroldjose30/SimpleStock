//
//  Resolver.swift
//  SimpleStock
//
//  Created by Jose Harold on 22/02/2023.
//

import Resolver

extension Resolver: ResolverRegistering {
    
    @MainActor
    public static func registerAllServices() {
        
        registerDataServices()
        registerDomainServices()
        registerPresentationServices()
    }
}
