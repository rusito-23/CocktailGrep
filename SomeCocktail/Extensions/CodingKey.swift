//
//  CodingKey.swift
//  SomeCocktail
//
//  Created by Igor Andruskiewitsch on 8/29/19.
//  Copyright © 2019 Rusito23. All rights reserved.
//

import Foundation

protocol IndexableKey: CodingKey {
    var stringValue: String { get }
}
    
extension IndexableKey {
    init?(stringValue: String) {
        return nil
    }
    
    init?(intValue: Int) {
        self.init(intValue: intValue)
    }    
}
