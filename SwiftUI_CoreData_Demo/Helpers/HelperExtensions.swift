//
//  HelperExtensions.swift
//  SwiftUI_CoreData_Demo
//
//  Created by Code Swiftly on 03/02/21.
//

import Foundation

extension Optional where Wrapped == String {
    var _value: String? {
        get {
            return self
        }
        set {
            self = newValue
        }
    }
    
    public var value: String {
        get {
            return _value ?? ""
        }
        set {
            _value = newValue.isEmpty ? nil : newValue
        }
    }
}

extension Date {
    func dateToString() -> String{
        let dateFormatter:DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let strdt = dateFormatter.string(from: self as Date)
        if let dtDate = dateFormatter.date(from: strdt){
            return dateFormatter.string(from: dtDate)
        }
        return "--"
    }
}


extension String {
    func toFloatValue() -> Float {
        return (NumberFormatter().number(from: self) ?? 0.0 ).floatValue
    }
}
