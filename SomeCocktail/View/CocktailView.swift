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
        
        return VStack(spacing: 10) {
            HStack { Spacer() }
            Text(cocktail.name).font(.title)
            Text("(\(cocktail.alcoholic ?? "unknown"))")
            Image(uiImage: imageModel.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
        }
    }
}
