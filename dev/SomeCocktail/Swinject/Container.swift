//
//  Container.swift
//  SomeCocktail
//
//  Created by Igor Andruskiewitsch on 8/30/19.
//  Copyright © 2019 Rusito23. All rights reserved.
//

import Foundation

class Container {
    
    static var container: [String: Any] = [:]
    
    static func register <T, R> (_ proto: T.Type, _ injection: R) {
        guard let _ = injection as? T else {
            fatalError("\(String(describing: R.self)) does not conform to \(String(describing: T.self))")
        }
        container[String(describing: proto.self)] = injection
    }
    
    static func resolve <T> (_ proto: T.Type) -> T? {
        return container[String(describing: proto.self)] as? T
    }
    
}
