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
    @Published var loading = true
    
    // MARK: Custom
    
    private let webService = injector.resolve(WebService.self)
     
    private func fetchCocktails() {
        webService?.search(by: "") { cocktails in
            DispatchQueue.main.async {
                self.cocktails = cocktails
                self.loading = false
            }
        }
    }
    
}
