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
    
    @Published var image = UIImage()
    
    // MARK: Custom
    
    func loadImage(url: String?) {
        guard let thumbURLString = url,
            let thumbURL = URL(string: thumbURLString) else { return }
            
        URLSession.shared.dataTask(with: thumbURL) { (data, res, error) in
            DispatchQueue.main.async {
                if let `data` = data,
                    let image = UIImage(data: data) {
                    self.image = image
                }
            }
        }.resume()
    }
    
}
