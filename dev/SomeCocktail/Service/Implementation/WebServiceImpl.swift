//
//  WebServiceImpl.swift
//  SomeCocktail
//
//  Created by Igor Andruskiewitsch on 9/2/19.
//  Copyright © 2019 Rusito23. All rights reserved.
//

import Foundation
import UIKit


class WebServiceImpl: WebService {
    let decoder = JSONDecoder()
    let encoder = JSONEncoder()
}
    
extension WebServiceImpl {
    
    func search(by name: String, completion: @escaping ([Cocktail]) -> Void) {
        let `name` = name.replacingOccurrences(of: " ", with: "%20")
        let urlString = Constants.URL.BASE + Constants.API_KEY + Constants.URL.SEARCH + name
        guard let url = URL(string: urlString) else { completion([]); return }
        
        URLSession.shared.dataTask(with: url) { [weak self] (data, res, error) in
            guard let `self` = self else { return }
            
            if let `error` = error {
                logger.error(error)
                completion([])
                return
            }
            
            guard let `data` = data,
                let cocktailRes = try? self.decoder.decode(CocktailResponse.self, from: data) else {
                    logger.error("Parse error")
                    completion([])
                    return
            }
            
            logger.verbose("Cocktails fetch success!")
            completion(cocktailRes.drinks)
        }.resume()
    }
    
    func image(by url: String?, completion: @escaping (UIImage?) -> Void) {
        guard let thumbURLString = url,
            let thumbURL = URL(string: thumbURLString) else { return }
        
        URLSession.shared.dataTask(with: thumbURL) { (data, res, error) in
            
            if let `error` = error {
                logger.error(error)
                completion(nil)
                return
            }
            
            guard let `data` = data,
                let image = UIImage(data: data) else {
                    logger.error("Error creating UIImage")
                    completion(nil)
                    return
            }
            
            logger.verbose("Cocktail thumb image fetch success!")
            completion(image)
        }.resume()
    }
    
    
}
