//
//  CocktailViewModel.swift
//  SomeCocktail
//
//  Created by Igor Andruskiewitsch on 8/30/19.
//  Copyright © 2019 Rusito23. All rights reserved.
//

import SwiftUI

struct CocktailViewModel: View {
    var cocktail: Cocktail
    
    var body: some View {
        HStack {
            Text(cocktail.name)
        }
    }
}
