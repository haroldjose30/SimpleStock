//
//  ProductRemoteDTO+mapToProductLocalDTO.swift
//  SimpleStock
//
//  Created by Jose Harold on 23/02/2023.
//

import RealmSwift

extension ProductRemoteDTO {
    
    func mapToProductLocalDTO() -> ProductLocalDTO {
        
        ProductLocalDTO(
            id: self.id,
            title: self.title,
            descr: self.description,
            price: self.price,
            discountPercentage: self.discountPercentage,
            rating: self.rating,
            stock: self.stock,
            brand: self.brand,
            category: self.category,
            thumbnail: self.thumbnail,
            images: self.images.mapToList()
        )
    }
}
