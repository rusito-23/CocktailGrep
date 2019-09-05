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
        LoadingView(isShowing: .constant(imageModel.loading)) {
            ScrollView {
                VStack {
                    
                    // MARK: Image
                    
                    Image(uiImage: self.imageModel.image)
                        .resizable()
                        .frame(width: 400, height: 400, alignment: .center)
                        .cornerRadius(6)
                    
                    // MARK: Instructions
                    
                    Text(self.cocktail.instructions ?? "Sorry! No instructions")
                        .lineLimit(nil)
                        .lineSpacing(10)
                        .multilineTextAlignment(.center)
                        .frame(minWidth: 0, idealWidth: 0, maxWidth: .infinity,
                               minHeight: 50, idealHeight: 100, maxHeight: 500, alignment: .center)
                        .padding(.leading, 10)
                        .padding(.trailing, 10)
                    
                    // MARK: Ingredients
                    
                    Text("Ingredients").font(.title)
                    ForEach(self.cocktail.ingredients) { ingredient in                        
                        HStack {

                            Text(ingredient.name)
                            Spacer().background(Color.black)
                            Text(ingredient.measure)

                        }.padding(.leading, 30).padding(.trailing, 30).padding(.bottom, 10)
                    }
                    
                }
            }.navigationBarTitle(self.cocktail.name)
        }
    }
}
