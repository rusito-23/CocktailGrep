//
//  CocktailListContainer.swift
//  SomeCocktail
//
//  Created by Igor Andruskiewitsch on 8/30/19.
//  Copyright © 2019 Rusito23. All rights reserved.
//

import SwiftUI

struct CocktailListContainer: View {
    
    @ObservedObject var model = CocktailListViewModel()
    
    var cocktails: [Cocktail] {
        get {
            if model.cocktails.isEmpty {
                return [Cocktail(with: "Sorry! No cocktails where found.")]
            } else {
                return model.cocktails
            }
        }
    }
    
    var body: some View {
        LoadingView(isShowing: .constant(self.model.loading)) {
            VStack {
                List {
                    SearchBar(didChange: { query in
                        self.model.query = query
                    })
                    
                    ForEach(self.cocktails) { cocktail in
                        NavigationLink(destination: CocktailDetailView(cocktail: cocktail )) {
                            CocktailCard(cocktail: cocktail)
                                .frame(minWidth: 0, idealWidth: 0, maxWidth: .infinity,
                                       minHeight: 0, idealHeight: 150, maxHeight: 200, alignment: .center)
                                .padding(.trailing, 10).padding(.leading, 10)
                        }
                    }

                }
            }
        }
    }
    
}
