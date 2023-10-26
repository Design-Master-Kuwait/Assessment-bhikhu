//
//  SceneDelegate.swift
//  Trivia Quiz
//
//  Created by Bhikhu on 26/10/23.
//


import Foundation

/// This is the default print function
internal func print(_ items: Any..., separator: String = " ", terminator: String = "\n") {
    #if DEBUG
        var i = items.startIndex
        repeat {
            Swift.print(items[i], separator: separator, terminator: i == (items.endIndex - 1) ? terminator : separator)
            i += 1
        } while i < items.endIndex
    #endif
    
}

public struct Log {
    
    /// This method will print the console log.
    ///
    /// - Parameter data: Data which you wanted to Print.
    static func console(_ data: Any) {
        #if DEBUG
            print(data)
        #endif
    }
    
}

class Logger {
    
    class func log(_ items: Any..., separator: String = " ", terminator: String = "\n", file: String = #file, function: String = #function, line: Int = #line) {
        
        #if DEBUG
        
        let fileURL = NSURL(string: file)?.lastPathComponent ?? "Unknown file"
        //        let queue = Thread.isMainThread ? "UI" : "BG"
        let gFormatter = DateFormatter()
        gFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSSS Z"
        let timestamp = gFormatter.string(from: Date())
        
        items.forEach { item in
            Swift.print("\(timestamp) | \(fileURL) > \(function)[\(line)] : \(item)", separator: separator, terminator: terminator)
        }
        
        #endif
        
    }
    
    
}
