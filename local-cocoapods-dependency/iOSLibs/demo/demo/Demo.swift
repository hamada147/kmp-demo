//
//  Demo.swift
//  demo
//
//  Created by Ahmed Moussa on 22/03/2023.
//

import Foundation

 // @objc => The only way to make this class and all its methods and variables available in Objective-C which the only way to make it available for KMP for Apple targets
// DO NOT FORGET to add the PUBLIC keyword to make the class, method, variable visiable
@objc public class Demo: NSObject { // I usually replace it with the name of the iOS lib
    
    // Just creating a singelton design pattern here
    private override init() {}
    
    ///
    /// Add function
    ///
    @objc public class func add(a: Int, b: Int) -> Int {
        return a + b
    }
    
    ///
    /// Multiply function
    ///
    @objc public class func multiply(a: Int, b: Int) -> Int {
        return a * b
    }
}
