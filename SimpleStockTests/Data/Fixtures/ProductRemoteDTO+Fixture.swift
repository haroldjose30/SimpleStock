//
//  ProductRemoteDTO+Fixture.swift
//  SimpleStockTests
//
//  Created by Jose Harold on 22/02/2023.
//

@testable import SimpleStock

extension ProductRemoteDTO {
    
    static func fixture(
        id: Int = 0,
        title: String = "",
        description: String = "",
        price: Int = 0,
        discountPercentage: Double = 0,
        rating: Double = 0,
        stock: Int = 0,
        brand: String = "",
        category: String = "",
        thumbnail: String = "",
        images: [String] = []
    ) -> ProductRemoteDTO {
        
        ProductRemoteDTO(
            id: id,
            title: title,
            description: description,
            price: price,
            discountPercentage: discountPercentage,
            rating: rating,
            stock: stock,
            brand: brand,
            category: category,
            thumbnail: thumbnail,
            images: images
        )
    }
     
}
