//
//  CocktailResponse.swift
//  SomeCocktail
//
//  Created by Igor Andruskiewitsch on 8/29/19.
//  Copyright © 2019 Rusito23. All rights reserved.
//

import Foundation


struct CocktailResponse: Decodable {
    var drinks: [Cocktail]
}
