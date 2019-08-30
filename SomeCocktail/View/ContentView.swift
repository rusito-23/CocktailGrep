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
        
        print("Fetching cocktails")
        WebServiceMock.fetchAll { cocktails in
            if cocktails.isEmpty {
                print("No cocktails available")
            }
            for cocktail in cocktails {
                print(cocktail.name)
            }
        }
        
        return Text("Hello World")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
