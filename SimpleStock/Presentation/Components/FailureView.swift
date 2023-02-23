//
//  FailureView.swift
//  SimpleStock
//
//  Created by Jose Harold on 22/02/2023.
//

import SwiftUI

struct FailureView: View {
    
    var message: String
    var action: (() -> Void)?
    
    var body: some View {
        VStack {
            Text(message)
            if let action = action {
                RetryButtonView {
                    action()
                }
            }
           
        }
    }
}

struct FailureView_Previews: PreviewProvider {
    static var previews: some View {
        FailureView(
            message: "Error message",
            action: {}
        )
    }
}
