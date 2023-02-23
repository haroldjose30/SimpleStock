//
//  EmptyStateView.swift
//  SimpleStock
//
//  Created by Jose Harold on 23/02/2023.
//

import SwiftUI

extension ProductListPage {
    
    struct EmptyStateView: View {
        
        var action: (() -> Void)?
        
        var body: some View {
            VStack {
                Text(Localizable.emptyMessage)
                if let action = action {
                    RetryButtonView(
                        action: action
                    )
                }
                
            }
        }
    }
}


extension ProductListPage.EmptyStateView {
    enum Localizable {
        static let emptyMessage = "No information was found, please try again"
    }
}


struct EmptyStateView_Previews: PreviewProvider {
    static var previews: some View {
        
        ProductListPage.EmptyStateView(action: {})
    }
}
