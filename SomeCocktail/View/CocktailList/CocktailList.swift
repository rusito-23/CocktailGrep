//
//  CocktailList.swift
//  SomeCocktail
//
//  Created by Igor Andruskiewitsch on 9/4/19.
//  Copyright © 2019 Rusito23. All rights reserved.
//

import SwiftUI

struct CocktailList: View {
    
    var cocktails: [Cocktail]
    
    var body: some View {
        VStack {
            List(cocktails) { cocktail in
                
                CocktailCard(cocktail: cocktail)
                
                NavigationLink("", destination: CocktailDetailView(cocktail: cocktail ))
                    .frame(width: 0, height: 0, alignment: .trailing)
                
            }.listStyle(GroupedListStyle())
        }
    }
}
