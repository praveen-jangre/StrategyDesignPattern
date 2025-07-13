//
//  Logger.swift
//  LoggingSystem
//
//  Created by Praveen Jangre on 13/07/2025.
//

import Foundation

protocol LogStrategy {
    func log(entry: String)
    func retrieveLogs() -> [String]?
}



// Console Logger
class ConsoleLogger: LogStrategy {
    func log(entry: String) {
        print(entry)
    }
    
    func retrieveLogs() -> [String]? {
        return nil
    }
}

// In-Memory Logger
class InMemoryLogger: LogStrategy {
    private var logEntries = [String]()
    
    func log(entry: String) {
        logEntries.append(entry)
    }
    
    func retrieveLogs() -> [String]? {
        return logEntries
    }
}


class Logger {
    private var strategy: LogStrategy
    
    init(strategy: LogStrategy) {
        self.strategy = strategy
    }
    
    func log(entry: String) {
        strategy.log(entry: entry)
    }
    
    var logs: [String]? { strategy.retrieveLogs() }
    
    func set(strategy: LogStrategy) {
        self.strategy = strategy
    }
}

// Usage example
func startLogger() {
    let logger = Logger(strategy: ConsoleLogger())
    logger.log(entry: "This is a console log")
    print(logger.logs ?? "No logs available")
    
    logger.set(strategy: InMemoryLogger())
    
    logger.log(entry: "This is an in-memory log")
    logger.log(entry: "Another in-memory log")
    logger.logs?.forEach {print($0)}
}

