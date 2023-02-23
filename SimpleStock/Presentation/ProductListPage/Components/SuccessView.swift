//
//  SuccessView.swift
//  SimpleStock
//
//  Created by Jose Harold on 22/02/2023.
//

import SwiftUI

extension ProductListPage {
    
    struct SuccessView: View {
        
        var products: [ProductModel]
        
        var body: some View {
            
            ScrollView {
                LazyVStack(alignment: .leading) {
                    ForEach(products, id: \.self) { product in
                        NavigationLink(
                            destination: ProductDetailPage(
                                product: product
                            )
                        ) {
                            ProductListPage.CardView(
                                product: product
                            )
                        }
                        
                    }
                }.padding(8)
            }
        }
    }
    
    
    struct CardView: View {
        
        let product: ProductModel
        
        let imageName: String = "globe"
        
        var body: some View {
            ZStack {
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(.gray)
                    .opacity(0.2)
                
                HStack {
                    
                    if let url = URL(string: product.thumbnail) {
                        
                        //TODO: add image fpr cache
                        AsyncImage(
                            url: url,
                            content: { uiImage in
                                uiImage
                                    .resizable()
                            },
                            placeholder: {
                                ProgressView()
                            }
                        )
                        .frame(width: 120, height: 120)
                        .mask(RoundedRectangle(cornerRadius: 16))
                        .padding(8)
                    }
                    
                    
                    VStack(alignment: .leading) {
                        Text(product.title)
                            .font(.title)
                            .foregroundColor(.black)
                        
                        HStack {
                            RatingView(rating: product.rating)
                            
                            Text(String(product.rating))
                                .font(.title3)
                                .foregroundColor(.gray)
                        }
                    }
                    
                    Spacer()
                }
            }
            .frame(height: 150)
        }
    }
}


struct SuccessView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListPage.SuccessView(
            products: getProductsForPreview()
        )
    }
}

private func getProductsForPreview() -> [ProductModel] {
    [
        ProductModel(
            id: 2,
            title: "iPhone X",
            description: "SIM-Free, Model A19211 6.5-inch Super Retina HD display with OLED technology A12 Bionic chip with ...",
            price: 899,
            discountPercentage: 17.94,
            rating: 4.44,
            stock: 34,
            brand: "Apple",
            category: "smartphones",
            thumbnail: "https://i.dummyjson.com/data/products/2/thumbnail.jpg",
            images: [
                "https://i.dummyjson.com/data/products/2/1.jpg",
                "https://i.dummyjson.com/data/products/2/2.jpg",
                "https://i.dummyjson.com/data/products/2/3.jpg",
                "https://i.dummyjson.com/data/products/2/thumbnail.jpg"
            ]
        ),
        
        ProductModel(
            id: 3,
            title: "OPPOF19",
            description: "SIM-Free, Model A19211 6.5-inch Super Retina HD display with OLED technology A12 Bionic chip with ...",
            price: 899,
            discountPercentage: 17.94,
            rating: 4.44,
            stock: 34,
            brand: "Apple",
            category: "smartphones",
            thumbnail: "https://i.dummyjson.com/data/products/2/thumbnail.jpg",
            images: [
                "https://i.dummyjson.com/data/products/2/1.jpg",
                "https://i.dummyjson.com/data/products/2/2.jpg",
                "https://i.dummyjson.com/data/products/2/3.jpg",
                "https://i.dummyjson.com/data/products/2/thumbnail.jpg"
            ]
        ),
        
        ProductModel(
            id: 4,
            title: "iPhone X",
            description: "SIM-Free, Model A19211 6.5-inch Super Retina HD display with OLED technology A12 Bionic chip with ...",
            price: 899,
            discountPercentage: 17.94,
            rating: 4.44,
            stock: 34,
            brand: "Apple",
            category: "smartphones",
            thumbnail: "https://i.dummyjson.com/data/products/2/thumbnail.jpg",
            images: [
                "https://i.dummyjson.com/data/products/2/1.jpg",
                "https://i.dummyjson.com/data/products/2/2.jpg",
                "https://i.dummyjson.com/data/products/2/3.jpg",
                "https://i.dummyjson.com/data/products/2/thumbnail.jpg"
            ]
        )
        
        
    ]
}
