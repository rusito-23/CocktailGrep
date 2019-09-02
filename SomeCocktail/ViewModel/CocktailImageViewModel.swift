//
//  CocktailImageViewModel.swift
//  SomeCocktail
//
//  Created by Igor Andruskiewitsch on 8/30/19.
//  Copyright © 2019 Rusito23. All rights reserved.
//

import Foundation
import UIKit

class CocktailImageViewModel: ObservableObject {
    
    // MARK: ObservableObject
    
    var imageURL: String? {
        didSet {
            loadImage(url: imageURL)
        }
    }
    
    @Published var image = UIImage(named: "cock_placeholder")!
    
    // MARK: Custom
    
    var loading = true
    private let webService = injector.resolve(WebService.self)
    
    func loadImage(url: String?) {
        webService?.image(by: url) { [weak self] image in
            guard let `self` = self else { return }
            DispatchQueue.main.async {
                if let `image` = image {
                    self.loading = false
                    self.image = image
                }
            }
        }
        
    }
    
}
