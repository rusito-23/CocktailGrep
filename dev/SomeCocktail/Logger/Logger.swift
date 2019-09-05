//
//  Logger.swift
//  SomeCocktail
//
//  Created by Igor Andruskiewitsch on 9/2/19.
//  Copyright © 2019 Rusito23. All rights reserved.
//

import Foundation

let logger = Log()

class Log {
    
    // MARK: Levels
    
    enum Level: String {
        case debug = "DEBUG 💬 "
        case verbose = "VERBOSE 🔬 "
        case info = "INFO ℹ️ "
        case warning = "WARNING ⚠️ "
        case severe = "SEVERE 🔥 "
        case error = "ERROR ‼️ "
    }
    
    
    // MARK: Utils
    
    private func getDate() -> String {
        return Date().toLoggerString()
    }
    
    private func sourceFileName(_ filePath: String) -> String {
        let components = filePath.components(separatedBy: "/")
        return components.isEmpty ? "" : components.last!
    }
    
}

// MARK: Log methods

extension Log {

    // MARK: Debug
    func debug(_ object: Any,
               filename: String = #file,
               line: Int = #line,
               column: Int = #column,
               funcName: String = #function) {
        #if DEBUG
        print("\(getDate()) \(Level.debug.rawValue)[\(sourceFileName(filename))]:\(line) \(column) \(funcName) -> \(object)")
        #endif
    }
    
    // MARK: Info
    func info(_ object: Any,
               filename: String = #file,
               line: Int = #line,
               column: Int = #column,
               funcName: String = #function) {
        print("\(getDate()) \(Level.info.rawValue)[\(sourceFileName(filename))]:\(line) \(column) \(funcName) -> \(object)")
    }
    
    // MARK: Warning
    func warn(_ object: Any,
               filename: String = #file,
               line: Int = #line,
               column: Int = #column,
               funcName: String = #function) {
        print("\(getDate()) \(Level.warning.rawValue)[\(sourceFileName(filename))]:\(line) \(column) \(funcName) -> \(object)")
    }

    // MARK: Verbose
    func verbose(_ object: Any,
               filename: String = #file,
               line: Int = #line,
               column: Int = #column,
               funcName: String = #function) {
        print("\(getDate()) \(Level.verbose.rawValue)[\(sourceFileName(filename))]:\(line) \(column) \(funcName) -> \(object)")
    }
    
    // MARK: severe
    func severe(_ object: Any,
               filename: String = #file,
               line: Int = #line,
               column: Int = #column,
               funcName: String = #function) {
        print("\(getDate()) \(Level.severe.rawValue)[\(sourceFileName(filename))]:\(line) \(column) \(funcName) -> \(object)")
    }
    
    // MARK: error
    func error(_ object: Any,
               filename: String = #file,
               line: Int = #line,
               column: Int = #column,
               funcName: String = #function) {
        print("\(getDate()) \(Level.error.rawValue)[\(sourceFileName(filename))]:\(line) \(column) \(funcName) -> \(object)")
    }
    
}
