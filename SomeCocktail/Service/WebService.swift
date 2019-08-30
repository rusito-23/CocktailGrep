//
//  WebService.swift
//  SomeCocktail
//
//  Created by Igor Andruskiewitsch on 8/29/19.
//  Copyright © 2019 Rusito23. All rights reserved.
//

import Foundation


protocol WebService {
    func fetchAll(completion: @escaping ([Cocktail]) -> Void)
}
