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
    var drinkAlt: String?
    var video: String?
    var alcoholic: String?
    var glass: String?
    var instructions: String?
    var thumb: String?
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
    
    private class IngredientKey: IndexableKeyImpl {
        override var stringTemplate: String {
            get {
                return  "strIngredient%d"
            }
        }
    }
    
    private class MeasureKey: IndexableKeyImpl {
        override var stringTemplate: String {
            get {
                return "strMeasure%d"
            }
        }
    }
    
    // MARK: Init from decoder
    
    init(from decoder: Decoder) throws {
        // containers
        
        let defaultContainer = try decoder.container(keyedBy: CodingKeys.self)
        let ingredientContainer = try decoder.container(keyedBy: IngredientKey.self)
        let measureContainer = try decoder.container(keyedBy: MeasureKey.self)
        
        // default values
        
        self.id = try defaultContainer.decode(String.self, forKey: .id)
        self.name = try defaultContainer.decode(String.self, forKey: .name)
        self.drinkAlt = try defaultContainer.decodeIfPresent(String.self, forKey: .drinkAlt)
        self.video = try defaultContainer.decodeIfPresent(String.self, forKey: .video)
        self.alcoholic = try defaultContainer.decodeIfPresent(String.self, forKey: .alcoholic)
        self.glass = try defaultContainer.decodeIfPresent(String.self, forKey: .glass)
        self.instructions = try defaultContainer.decodeIfPresent(String.self, forKey: .instructions)
        self.thumb = try defaultContainer.decodeIfPresent(String.self, forKey: .thumb)
        
        // ingredients
        
        self.ingredients = []
        for i in 1...15 {
            guard let ingredientKey = IngredientKey(intValue: i),
                let measureKey = MeasureKey(intValue: i),
                let name = try? ingredientContainer.decode(String.self, forKey: ingredientKey),
                let measure = try? measureContainer.decode(String.self, forKey: measureKey),
                !name.isEmpty else {
                    continue
            }
            
            ingredients.append(Ingredient(id: i, name: name, measure: measure))
        }
    }
    
}
