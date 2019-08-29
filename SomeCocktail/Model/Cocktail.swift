//
//  Cocktail.swift
//  SomeCocktail
//
//  Created by Igor Andruskiewitsch on 8/29/19.
//  Copyright © 2019 Rusito23. All rights reserved.
//

import Foundation

struct Cocktail: Identifiable, Decodable {
    
    // MARK: Vars
    
    var id: String
    var name: String
    var drinkAlt: String
    var video: String
    var alcoholic: String
    var glass: String
    var instructions: String
    var thumb: String
    var ingredients: [Ingredient]
    
    // MARK: Keys
    
    private enum CodingKeys: String, CodingKey {
        case id = "idDrink"
        case name = "strDrink"
        case drinkAlt = "strDrinkAlternate"
        case video = "strVideo"
        case alcoholic = "strAlcoholic"
        case glass = "strGlass"
        case instructions = "strInstructions"
        case thumb = "strDrinkThumb"
    }
    
    private struct IngredientKey: IndexableKey {
        var intValue: Int?
        var stringValue: String { get {
            return "strIngredient\(self.intValue ?? 1)"
        }}
    }
    
    private struct MeasureKey: IndexableKey {
        var intValue: Int?
        var stringValue: String { get {
            return "strMeasure\(self.intValue ?? 1)"
        }}
    }
    
    // MARK: Init from decoder
    
    init(from decoder: Decoder) throws {
        try self.init(from: decoder)

        let ingredientContainer = try decoder.container(keyedBy: IngredientKey.self)
        let measureContainer = try decoder.container(keyedBy: MeasureKey.self)

        self.ingredients = []
        for i in 1...15 {
            guard let ingredientKey = IngredientKey(intValue: i) else { continue }
            guard let measureKey = MeasureKey(intValue: i) else { continue }
            
            let name = try ingredientContainer.decode(String.self, forKey: ingredientKey)
            let measure = try measureContainer.decode(String.self, forKey: measureKey)
            
            ingredients.append(Ingredient(id: i, name: name, measure: measure))
        }
    }
    
}
