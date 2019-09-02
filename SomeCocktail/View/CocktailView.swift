//
//  CocktailView.swift
//  SomeCocktail
//
//  Created by Igor Andruskiewitsch on 8/30/19.
//  Copyright © 2019 Rusito23. All rights reserved.
//

import SwiftUI

struct CocktailView: View {
    var cocktail: Cocktail
    @ObservedObject var imageModel = CocktailImageViewModel()
    
    var backgroundStyle: ContentMode {
        return self.imageModel.loading ? .fit : .fill
    }
    
    var backgroundAlpha: Double {
        return self.imageModel.loading ? 0.1 : 1
    }
    
    var body: some View {
        imageModel.imageURL = cocktail.thumb
        
        return VStack(alignment: .leading) {
            
            StrokeText(text: cocktail.name,
                       font: UIFont(name:"Helvetica-Bold", size: 35.0)!)
                .padding(.leading)
            
            StrokeText(text: "(\(cocktail.alcoholic ?? "unknown"))",
                font: UIFont(name:"Helvetica", size: 18.0)!)
                .padding(.leading)
                .padding(.top, -60.0)
            
            Spacer()
            Spacer()
            
        }.frame(minWidth: 0, maxWidth: .infinity,
                minHeight: 0, maxHeight: 200, alignment: .topLeading)
        .background(
            Image(uiImage: imageModel.image)
                .resizable()
                .aspectRatio(contentMode: backgroundStyle)
            .opacity(backgroundAlpha)
        ).cornerRadius(6)
    }
}
