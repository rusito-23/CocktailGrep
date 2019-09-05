//
//  CocktailCard.swift
//  SomeCocktail
//
//  Created by Igor Andruskiewitsch on 8/30/19.
//  Copyright © 2019 Rusito23. All rights reserved.
//

import SwiftUI

struct CocktailCard: View {
    var cocktail: Cocktail
    @ObservedObject var imageModel = CocktailImageViewModel()
    
    init(cocktail: Cocktail) {
        self.cocktail = cocktail
        imageModel.imageURL = cocktail.thumb
    }
    
    var backgroundStyle: ContentMode {
        return self.imageModel.loading ? .fit : .fill
    }
    
    var backgroundAlpha: Double {
        return self.imageModel.loading ? 0.1 : 1
    }
    
    var alcoholicSign: UIImage {
        let alcoholic = cocktail.alcoholic ?? "unknown"
        return alcoholic == "Alcoholic" ? UIImage() : UIImage(named: "alcohol_free")!
    }
    
    var body: some View {
        return VStack(alignment: .leading) {
            
            HStack() {
                StrokeText(text: cocktail.name,
                           font: UIFont(name:"Helvetica-Bold", size: 35.0)!)
                    .padding(.leading).padding(.top, -50) // TODO: do not cut
                
                Image(uiImage: alcoholicSign).resizable()
                    .frame(width: 150, height: 150)
            }
            
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
