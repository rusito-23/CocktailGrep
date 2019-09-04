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
    @State private var searchField = ""
    
    var listView: some View {
        if model.cocktails.isEmpty && !model.loading {
            return AnyView(ErrorView())
        }
        
        return AnyView(
            VStack {
                TextField("Search by name", text: $searchField)
                CocktailList(cocktails: self.model.cocktails)
            }
        )
    }
    
    var body: some View {
        LoadingView(isShowing: .constant(self.model.loading)) {
            self.listView
        }
    }
    
}
