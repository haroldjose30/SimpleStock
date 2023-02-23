//
//  SimpleData.swift
//  SimpleStock
//
//  Created by Jose Harold on 23/02/2023.
//

import SwiftUI

extension ProductDetailPage {
    
    struct SimpleDataView: View {
        
        let title: String
        let value: String
        
        var body: some View {
            HStack {
                
                Text(title)
                    .font(.title)
                    .foregroundColor(.black)
                
                Text(value)
                    .font(.title)
                    .foregroundColor(.gray)
                
            }
        }
    }
}



struct SimpleData_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailPage.SimpleDataView(
            title: "title",
            value: "value"
        )
    }
}
