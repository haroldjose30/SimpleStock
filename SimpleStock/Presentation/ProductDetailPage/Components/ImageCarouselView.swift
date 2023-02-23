//
//  ImageCarouselView.swift
//  SimpleStock
//
//  Created by Jose Harold on 23/02/2023.
//

import SwiftUI

struct ImageCarouselView: View {
    
    var imagesUrl: [String]
    
    @State private var currentIndex: Int = 0
    
    private let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    
    init(imagesUrl: [String]) {
        self.imagesUrl = imagesUrl
    }
    
    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 0) {
                ForEach(imagesUrl, id: \.self) { url in
                    AsyncImage(
                        url: URL(string: url),
                        content: { uiImage in
                            uiImage
                                .resizable()
                                .frame(width: geometry.size.width, height: geometry.size.height)
                                .clipped()
                        },
                        placeholder: {
                            ProgressView()
                        }
                    )
                }
            }
            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .leading)
            .offset(x: CGFloat(self.currentIndex) * -geometry.size.width, y: 0)
            .animation(.spring())
            .onReceive(self.timer) { _ in
                
                self.currentIndex = (self.currentIndex + 1) % 3
            }
        }
    }
}

struct ImageCarouselView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geometry in
            ImageCarouselView(
                imagesUrl: [
                    "https://i.dummyjson.com/data/products/2/1.jpg",
                    "https://i.dummyjson.com/data/products/2/2.jpg",
                    "https://i.dummyjson.com/data/products/2/3.jpg",
                    "https://i.dummyjson.com/data/products/2/thumbnail.jpg"
                ]
            )
        }.frame(height: 300, alignment: .center)
    }
}
