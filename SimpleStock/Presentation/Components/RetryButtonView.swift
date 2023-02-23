//
//  RetryButtonView.swift
//  SimpleStock
//
//  Created by Jose Harold on 22/02/2023.
//

import SwiftUI

struct RetryButtonView: View {
    
    var action: () -> Void
    
    var body: some View {
        
        Button(
            Localizable.retry,
            action: action
        )

    }
}

extension RetryButtonView {
    enum Localizable {
        static let retry = "Retry"
    }
}

struct RetryButtonView_Previews: PreviewProvider {
    static var previews: some View {
        RetryButtonView(action: {})
    }
}
