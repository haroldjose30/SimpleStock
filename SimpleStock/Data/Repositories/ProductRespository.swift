//
//  ProductLocalRespository.swift
//  SimpleStock
//
//  Created by Jose Harold on 22/02/2023.
//

@MainActor
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
    ) async throws -> [ProductDTO] {
        
        //Verify if exist data from local database and return it first
        if let productsFromLocal = try await localDataSource.getProducts(
            limit: limit,
            skip: skip
        ) {
            
            return productsFromLocal.products.map { product in
                ProductDTO(
                    id: product.id,
                    title: product.title,
                    description: product.description,
                    price: product.price,
                    discountPercentage: product.discountPercentage,
                    rating: product.rating,
                    stock: product.stock,
                    brand: product.brand,
                    category: product.category,
                    thumbnail: product.thumbnail,
                    images: product.images.mapToArray()
                )
            }
        }
        
        //if not exists data from local dataBase get from RemoteApi
        let remoteData = try? await remoteDataSource.getProducts(
            limit: limit,
            skip: skip
        )
        
        guard let remoteData = remoteData else {
            return []
        }
        
        
        //Save remote data on local
        
        try? await localDataSource.add(
            products: remoteData.mapToProductsLocalHeader()
        )
        
        
        
        return remoteData.products.map { product in
            ProductDTO(
                id: product.id,
                title: product.title,
                description: product.description,
                price: product.price,
                discountPercentage: product.discountPercentage,
                rating: product.rating,
                stock: product.stock,
                brand: product.brand,
                category: product.category,
                thumbnail: product.thumbnail,
                images: product.images
            )
        }
    }
}
