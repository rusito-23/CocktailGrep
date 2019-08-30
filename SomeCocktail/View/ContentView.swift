//
//  ContentView.swift
//  SomeCocktail
//
//  Created by Igor Andruskiewitsch on 8/29/19.
//  Copyright © 2019 Rusito23. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    
    @ObservedObject var model = CocktailListViewModel()
    
    var body: some View {
        if model.cocktails.isEmpty {
            return AnyView(VStack{
                Text("Sorry!")
                Text("No cocktails are available")
            })
        } else {
            return AnyView( List(model.cocktails) { cocktail in
                CocktailViewModel(cocktail: cocktail)
            })
        }
    }
}
