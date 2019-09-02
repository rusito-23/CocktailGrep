//
//  CocktailView.swift
//  SomeCocktail
//
//  Created by Igor Andruskiewitsch on 8/30/19.
//  Copyright © 2019 Rusito23. All rights reserved.
//

import SwiftUI

struct CocktailView: View {
    var cocktail: Cocktail
    @ObservedObject var imageModel = CocktailImageViewModel()
    
    var backgroundStyle: ContentMode {
        return self.imageModel.loading ? .fit : .fill
    }
    
    var body: some View {
        imageModel.imageURL = cocktail.thumb
        
        return VStack(alignment: .leading, spacing: 10) {
            
            StrokeText(text: cocktail.name,
                       font: UIFont(name:"Helvetica-Bold", size: 32.0)!)
            StrokeText(text: "(\(cocktail.alcoholic ?? "unknown"))",
                font: UIFont(name:"Helvetica", size: 18.0)!)
            
        }.frame(minWidth: 0, maxWidth: .infinity,
                minHeight: 0, maxHeight: 200, alignment: .topLeading)
        .background(
            Image(uiImage: imageModel.image)
                .resizable()
                .aspectRatio(contentMode: backgroundStyle)
        ).cornerRadius(6)
    }
}
