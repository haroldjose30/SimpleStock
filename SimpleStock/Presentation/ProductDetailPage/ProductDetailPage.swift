//
//  ProductDetailPage.swift
//  SimpleStock
//
//  Created by Jose Harold on 22/02/2023.
//

import SwiftUI
import Resolver

struct ProductDetailPage: View {
    
    var product: ProductModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
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
                
                Group {
                    Text(product.description)
                        .lineLimit(5)
                        .font(.title3)
                        .foregroundColor(.gray)
                    
                    SimpleDataView(
                        title: "Price:",
                        value: "$\(product.price)"
                    )
                    
                    SimpleDataView(
                        title: "Discount:",
                        value: "%\(product.discountPercentage)"
                    )
                    
                    SimpleDataView(
                        title: "Stock:",
                        value: "\(product.stock)"
                    )
                    
                    GeometryReader { geometry in
                        ImageCarouselView(
                            imagesUrl: product.images
                        )
                    }.frame(height: 300, alignment: .center)
                    
                }
                
            }.padding(8)
            
        }
        .padding(16)
        .navigationTitle("Product Detail")
       
    }
    
    func CarrousselGallery(){
        
    }
}

struct ProductDetailPage_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailPage(
            product: ProductModel(
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
            )
        )
    }
}
