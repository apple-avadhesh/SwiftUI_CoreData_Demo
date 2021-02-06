//
//  MockEmployeePreviewData.swift
//  SwiftUI_CoreData_Demo
//
//  Created by Code Swiftly on 03/02/21.
//

import SwiftUI

struct MockEmployeePreviewData {
   
    static let moc = CoreDataManager.shared.context
    
    static var emp1: Employee = {
        let emp = Employee(context: moc)
        emp.designation = "Senior Programmer"
        emp.firstName = "John"
        emp.lastName = "Cena"
        emp.joiningDate = Date()
        emp.empID = "007"
        emp.account = accountInfo
        return emp
    }()
    
    static var accountInfo: Account = {
        let account = Account(context: moc)
        account.accountNumber = "1039531801"
        account.salary = 120000
        return account
    }()
}
