//
//  WebServiceMock.swift
//  SomeCocktail
//
//  Created by Igor Andruskiewitsch on 8/29/19.
//  Copyright © 2019 Rusito23. All rights reserved.
//

import Foundation


class WebServiceMock: WebService {
    
    static let MOCK_FILE_NAME = "Cocktails"
    static let decoder = JSONDecoder()
    
    static func fetchAll(completion: @escaping ([Cocktail]) -> Void) {
        guard let jsonFile = Bundle.main.path(forResource: MOCK_FILE_NAME, ofType: "json") else { completion([]); return }
        let json = try? String(contentsOfFile: jsonFile)
        guard let data = json?.data(using: .utf8) else { completion([]); return }
        
        let cocktails = try? decoder.decode(CocktailResponse.self, from: data)
        
        completion(cocktails?.drinks ?? [])
    }
    
    
}
