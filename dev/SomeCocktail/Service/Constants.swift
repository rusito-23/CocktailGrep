//
//  Constants.swift
//  SomeCocktail
//
//  Created by Igor Andruskiewitsch on 9/2/19.
//  Copyright © 2019 Rusito23. All rights reserved.
//

import Foundation

struct Constants {
    
    static let API_KEY = "1"
    
    struct URL {
        static let BASE = "https://www.thecocktaildb.com/api/json/v1/"
        
        static let SEARCH = "/search.php?s="
        static let FLETTER = "/search.php?f=a"
        static let INGREDIENT = "/search.php?i=vodka"
        // TODO: missing urls
        
    }
    
}
