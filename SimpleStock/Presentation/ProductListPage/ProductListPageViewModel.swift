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
    
    @Published var pageState: PageState<[ProductModel]> = .empty
    private var skip: Int = 0
    
    private let getProductsUseCase: GetProductsUseCaseProtocol
    
    init(
        getProductsUseCase: GetProductsUseCaseProtocol
    ) {
        
        self.getProductsUseCase = getProductsUseCase
    }
    
    func loadData() async {
        
        pageState = .loading
        do {
            let products = try await getProductsUseCase.execute(
                limit: Constants.limit,
                skip: skip
            )
            skip += 1
            
            pageState = products.isEmpty ?
                .empty :
                .success(data: products)
            
        } catch {
            pageState = .failure(message: Localizable.genericError)
        }
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
