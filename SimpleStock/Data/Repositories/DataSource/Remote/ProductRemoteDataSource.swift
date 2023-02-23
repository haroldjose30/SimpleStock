//
//  ProductRemoteDataSource.swift
//  SimpleStock
//
//  Created by Jose Harold on 22/02/2023.
//

import Foundation


enum ProductRemoteDataSourceError: Error {
    case missingURL
    case httpGenericError
    case parserError
}

class ProductRemoteDataSource: ProductRemoteDataSourceProtocol {
    
    //TODO: add this in a enviroment variable like cocoapods-keys for define debug, staging or production enviroments
    private let baseUrl = "https://dummyjson.com/products"
    
    func getProducts(
        limit: Int,
        skip: Int
    ) async throws -> ProductsRemoteResponse {
        
        let urlString = baseUrl + "?limit=\(limit)&skip=\(skip)"
        
        guard let url = URL(string: urlString) else {
            
            throw ProductRemoteDataSourceError.missingURL
        }
        
        print(ProductRemoteDataSource.self,"url",url)
        
        //TODO: create a baseClass for all httpRequest like a ClientHTTP, and avoid duplications and put this on DI
        var urlRequest = URLRequest(url: url)
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            
            throw ProductRemoteDataSourceError.httpGenericError
        }
        
        let productsRemoteResponse = try? JSONDecoder().decode(ProductsRemoteResponse.self, from: data)
        guard let productsRemoteResponse = productsRemoteResponse else {
            
            throw ProductRemoteDataSourceError.parserError
        }

        return productsRemoteResponse
    }
}
