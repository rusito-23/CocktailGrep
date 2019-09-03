//
//  CocktailList.swift
//  SomeCocktail
//
//  Created by Igor Andruskiewitsch on 8/30/19.
//  Copyright © 2019 Rusito23. All rights reserved.
//

import SwiftUI

struct CocktailList: View {
    
    @ObservedObject var model = CocktailListViewModel()
    
    var listView: some View {
        if model.cocktails.isEmpty && !model.loading {
            return AnyView(
                VStack{
                    Text("Sorry!").font(.largeTitle)
                    Text("No cocktails are available").font(.title)
                }
            )
        } else {
            return AnyView(
                List(self.model.cocktails) { cocktail in
                    CocktailCard(cocktail: cocktail)
                    NavigationLink("", destination: CocktailDetailView(cocktail: cocktail ))
                        .frame(width: 0, height: 0, alignment: .trailing)
                }.listStyle(DefaultListStyle())
            )
        }
    }
    
    var body: some View {
        LoadingView(isShowing: .constant(self.model.loading)) {
            self.listView
        }
    }
    
}
