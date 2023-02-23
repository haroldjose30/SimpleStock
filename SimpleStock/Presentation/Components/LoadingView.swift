//
//  LoadingView.swift
//  SimpleStock
//
//  Created by Jose Harold on 22/02/2023.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack {
            Text(Localizable.loading)
            ProgressView()
        }
    }
}

extension LoadingView {
    enum Localizable {
        static let loading = "Loading Data..."
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
