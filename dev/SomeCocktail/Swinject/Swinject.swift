//
//  Swinject.swift
//  SomeCocktail
//
//  Created by Igor Andruskiewitsch on 8/30/19.
//  Copyright © 2019 Rusito23. All rights reserved.
//

import Foundation


let injector = Swinject.container

class Swinject {
    fileprivate static let container = Container.self
    
    public static func setup() {
        container.register(WebService.self, WebServiceImpl())
    }
    
}
