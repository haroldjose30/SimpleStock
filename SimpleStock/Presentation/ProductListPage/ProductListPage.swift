//
//  ProductListPage.swift
//  SimpleStock
//
//  Created by Jose Harold on 22/02/2023.
//

import SwiftUI
import Resolver

struct ProductListPage: View {
    
    @StateObject var viewModel: ProductListPageViewModel = Resolver.resolve()
    
    var body: some View {
        
        VStack {
            switch viewModel.pageState {
            case .loading:
                LoadingView()
            case .failure(let message):
                FailureView(
                    message: message,
                    action: loadData
                )
            case .success(let data):
                ProductListPage.SuccessView(products: data)
            default:
                ProductListPage.EmptyStateView(
                    action: loadData
                )
            }
        }.onAppear() {
            loadData()
        }
        .navigationTitle("Product List")
    }
    
    func loadData() {
        Task { await viewModel.loadData() }
    }
}

struct ProductListPage_Previews: PreviewProvider {
    static var previews: some View {

        ProductListPage(
            viewModel: ProductListPageViewModel(
                getProductsUseCase: GetProductsUseCaseForPreview()
            )
        )
    }
}

private class GetProductsUseCaseForPreview: GetProductsUseCaseProtocol {
    func execute(limit: Int, skip: Int) async throws -> [ProductModel] {
        
        return []
    }
}
