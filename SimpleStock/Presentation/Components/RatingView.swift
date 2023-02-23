//
//  RatingView.swift
//  SimpleStock
//
//  Created by Jose Harold on 22/02/2023.
//

import SwiftUI

struct RatingView: View {
    var rating: Double
    
    var body: some View {
        Image(systemName: getImageNameByRating(rating))
            .resizable()
            .imageScale(.large)
            .foregroundColor(.accentColor)
            .frame(width: 25, height: 25)
    }
    
    private func getImageNameByRating(
        _ rating: Double
    ) -> String {
        
        
        if rating < 3 {
            return "star"
        }
        
        if rating >= 3 &&  rating <= 4 {
            return "star.leadinghalf.filled"
        }
        
      
        return "star.fill"
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            RatingView(rating: -100)
            RatingView(rating: 0)
            RatingView(rating: 1)
            RatingView(rating: 2)
            RatingView(rating: 3)
            RatingView(rating: 4)
            RatingView(rating: 5)
            RatingView(rating: 500)
        }
    }
}
