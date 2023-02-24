//
//  ProductListPageViewModel.swift
//  SimpleStock
//
//  Created by Jose Harold on 22/02/2023.
//

import Foundation
import Combine

@MainActor
class ProductListPageViewModel: ObservableObject {
    
    @Published var pageState: PageState<[ProductModel]> = .loading
    private var skipState: Int = 0
    
    private let getProductsUseCase: GetProductsUseCaseProtocol
    
    init(
        getProductsUseCase: GetProductsUseCaseProtocol
    ) {
        
        self.getProductsUseCase = getProductsUseCase
    }
    
    func loadInitialData() async {
        
        pageState = .loading
        do {
            skipState = 0
            let products = try await loadData(
                toSkip: skipState
            )
            
            pageState = products.isEmpty ?
                .empty :
                .success(data: products)
            
        } catch {
            pageState = .failure(message: Localizable.genericError)
        }
    }
    
    
    func loadMore() async -> [ProductModel] {
        
        do {
            let products = try await loadData(
                toSkip: skipState + Constants.limit
            )
            
            if !products.isEmpty {
                skipState += Constants.limit
            }
            return products
            
        } catch {
            pageState = .failure(message: Localizable.genericError)
        }
        
        return []
    }
    
    private func loadData(toSkip: Int) async throws -> [ProductModel] {
        
        let products = try await getProductsUseCase.execute(
            limit: Constants.limit,
            skip: toSkip
        )
        
        return products
    }
}

extension ProductListPageViewModel {
    enum Localizable {
        static let genericError = "Oops! Something went wrong"
    }
}


private enum Constants {
    static let limit = 10
}
