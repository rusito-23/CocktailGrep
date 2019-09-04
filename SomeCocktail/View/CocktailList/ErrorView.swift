//
//  ErrorView.swift
//  SomeCocktail
//
//  Created by Igor Andruskiewitsch on 9/4/19.
//  Copyright © 2019 Rusito23. All rights reserved.
//

import SwiftUI

struct ErrorView: View {
    var body: some View {
        VStack{
            Text("Sorry!").font(.largeTitle)
            Text("No cocktails are available").font(.title)
        }
    }
}
