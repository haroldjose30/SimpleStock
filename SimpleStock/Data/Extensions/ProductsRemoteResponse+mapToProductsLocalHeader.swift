//
//  ProductsRemoteResponse+ToLocalHeader.swift
//  SimpleStock
//
//  Created by Jose Harold on 23/02/2023.
//

import RealmSwift

extension ProductsRemoteResponse {
    
    func mapToProductsLocalHeader() -> ProductsLocalHeader {
        
        ProductsLocalHeader(
            products: self.products
                .map { $0.mapToProductLocalDTO() }
                .mapToList(),
            total: self.total,
            skip: self.skip,
            limit: self.limit
        )
    }
}
