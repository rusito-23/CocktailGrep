//
//  CocktailDetailView.swift
//  SomeCocktail
//
//  Created by Igor Andruskiewitsch on 8/30/19.
//  Copyright © 2019 Rusito23. All rights reserved.
//

import SwiftUI

struct CocktailDetailView: View {
    var cocktail: Cocktail
    @ObservedObject var imageModel = CocktailImageViewModel()
    
    init(cocktail: Cocktail) {
        self.cocktail = cocktail
        imageModel.imageURL = cocktail.thumb
    }
    
    var body: some View {
        ScrollView() {
            VStack() {
                Text(cocktail.name).font(.largeTitle).fontWeight(.bold)
                Image(uiImage: imageModel.image).resizable()
                    .frame(width: 400, height: 400, alignment: .center)
                    .cornerRadius(6)
                Text(cocktail.instructions ?? "No instructions").font(.body)
                    .frame(width: 400, height: 400, alignment: .center)
            }
        }
    }
}
