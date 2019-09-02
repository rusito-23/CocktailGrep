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
    
    var body: some View {
        imageModel.imageURL = cocktail.thumb
        
        return VStack(alignment: .leading, spacing: 10) {
            Text(cocktail.name).font(.largeTitle)
            Text("(\(cocktail.alcoholic ?? "unknown"))").font(.title)
        }.frame(minWidth: 0, maxWidth: .infinity,
                minHeight: 0, maxHeight: 200, alignment: .topLeading)
        .background(
            Image(uiImage: imageModel.image)
                .resizable()
                .scaledToFill()
        ).cornerRadius(10)
    }
}
