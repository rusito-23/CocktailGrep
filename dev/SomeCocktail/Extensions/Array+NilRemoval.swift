//
//  Array+NilRemoval.swift
//  SomeCocktail
//
//  Created by Igor Andruskiewitsch on 9/3/19.
//  Copyright © 2019 Rusito23. All rights reserved.
//

import Foundation

extension Collection where Element == Optional<Ingredient> {
    func values() -> [Element] {
        return filter({ $0 != nil })
    }
}
