//
//  CodingKey.swift
//  SomeCocktail
//
//  Created by Igor Andruskiewitsch on 8/29/19.
//  Copyright © 2019 Rusito23. All rights reserved.
//

import Foundation

protocol IndexableKey: CodingKey {
    var stringTemplate: String { get }
}

class IndexableKeyImpl: IndexableKey {
    var stringTemplate: String {
        get { return "" }
    }
    var intValue: Int?
    var stringValue: String { get {
        String.init(format: self.stringTemplate, intValue ?? 0)
    }}
    
    required init?(stringValue: String) {
        return nil
    }
    
    required init?(intValue: Int) {
        self.intValue = intValue
    }

}
