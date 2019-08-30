//
//  ContentView.swift
//  SomeCocktail
//
//  Created by Igor Andruskiewitsch on 8/29/19.
//  Copyright © 2019 Rusito23. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    
    var body: some View {
        NavigationView {
            CocktailList()
            .navigationBarTitle(Text("Cocktails"))
        }
    }
    
}
