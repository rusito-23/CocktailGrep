//
//  WebService.swift
//  SomeCocktail
//
//  Created by Igor Andruskiewitsch on 8/29/19.
//  Copyright © 2019 Rusito23. All rights reserved.
//

import Foundation
import UIKit

protocol WebService {
    
    func search(by name: String, completion: @escaping ([Cocktail]) -> Void)
    
    func image(by url: String?, completion: @escaping (UIImage?) -> Void)
    
}
