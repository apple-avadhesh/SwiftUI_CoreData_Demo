//
//  CoreData+Extensions.swift
//  SwiftUI_CoreData_Demo
//
//  Created by Code Swiftly on 03/02/21.
//

import Foundation
import CoreData

//MARK: Employee+Extension
extension Employee {
    
    //Create instance of the Account
    public var employeeAccount: Account  {
        account ?? Account()
    }
    
    static var empFetchRequest: NSFetchRequest<Employee> {
        let req:NSFetchRequest<Employee> = Employee.fetchRequest()
        req.sortDescriptors = [NSSortDescriptor(keyPath: \Employee.joiningDate, ascending: true)]
        return req
    }
}


//MARK: Account+Extension
extension Account {
    
    public var displaySalary: String {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        currencyFormatter.locale = Locale.current
        currencyFormatter.maximumFractionDigits = 2
        if let strSalary = currencyFormatter.string(from: NSNumber(value: self.salary)) {
            return strSalary
        } else { return "$0.00" }
    }
}
