//
//  Date+Formatter.swift
//  SomeCocktail
//
//  Created by Igor Andruskiewitsch on 9/3/19.
//  Copyright © 2019 Rusito23. All rights reserved.
//

import Foundation


extension Date {
    
    func toLoggerString() -> String {
        let loggerDateFormat = "yyyy-MM-dd HH:mm:ss"
        let loggerFormatter = DateFormatter()
        loggerFormatter.dateFormat = loggerDateFormat
        loggerFormatter.locale = Locale.current
        loggerFormatter.timeZone = TimeZone.current
        return loggerFormatter.string(from: self as Date)
    }
    
}
