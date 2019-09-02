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
    
    var body: some View {
        if model.cocktails.isEmpty {
            return AnyView(VStack{
                Text("Sorry!").font(.largeTitle)
                Text("No cocktails are available").font(.title)
            })
        } else {
            return AnyView( List(model.cocktails) { cocktail in
                CocktailView(cocktail: cocktail)
                NavigationLink("", destination: CocktailDetailView())
                    .frame(width: 0, height: 0, alignment: .trailing)
            }.listStyle(DefaultListStyle())
            )
        }
    }
    
}
