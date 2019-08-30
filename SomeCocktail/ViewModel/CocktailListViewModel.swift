//
//  CocktailListViewModel.swift
//  SomeCocktail
//
//  Created by Igor Andruskiewitsch on 8/30/19.
//  Copyright © 2019 Rusito23. All rights reserved.
//

import Foundation
import SwiftUI

class CocktailListViewModel: ObservableObject {
    
    // MARK: ObservableObject
    
    init() {
        fetchCocktails()
    }
    
    @Published var cocktails = [Cocktail]()
    
    // MARK: Custom
    
    private let webService = injector.resolve(WebService.self)
     
    private func fetchCocktails() {
        webService?.fetchAll { cocktails in
            self.cocktails = cocktails
        }
    }
    
}