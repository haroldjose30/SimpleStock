//
//  ProductRemoteDTO+mapToModel.swift
//  SimpleStock
//
//  Created by Jose Harold on 22/02/2023.
//

extension ProductRemoteDTO {
    
    func mapToModel() -> ProductModel {
        
        ProductModel(
            id: self.id,
            title: self.title,
            description: self.description,
            price: self.price,
            discountPercentage: self.discountPercentage,
            rating: self.rating,
            stock: self.stock,
            brand: self.brand,
            category: self.category,
            thumbnail: self.thumbnail,
            images: self.images
        )
    }
}
