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
    
    init() {
        fetchCocktails()
    }
    
    @Published var cocktails = [Cocktail]()
    
    private func fetchCocktails() {
        WebServiceMock.fetchAll { cocktails in
            self.cocktails = cocktails
        }
    }
    
}
