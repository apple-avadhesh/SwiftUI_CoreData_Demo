//
//  CreateEmployeeViewModel.swift
//  SwiftUI_CoreData_Demo
//
//  Created by Code Swiftly on 03/02/21.
//

import Foundation
import CoreData
import Combine

class CreateEmployeeViewModel: ObservableObject {
    
    //MARK: Properties
    
    @Published var designation: String = ""
    @Published var empID: String = ""
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var doj: Date = Date()

    @Published var accountNumber: String = ""
    @Published var salary: String = ""

    func createEmployee() {
        let currentEmp = Employee(context: CoreDataManager.shared.context)
        
        CoreDataManager.shared.context.perform { [self] in
            let currentAccount = Account(context: CoreDataManager.shared.context)
            currentAccount.accountNumber = accountNumber
            currentAccount.salary = salary.toFloatValue()
            
            currentEmp.designation = designation
            currentEmp.empID = empID
            currentEmp.firstName = firstName
            currentEmp.lastName = lastName
            currentEmp.joiningDate = doj
            currentEmp.account = currentAccount
            CoreDataManager.shared.save()
            clearData()
        }
    }
    
    private func clearData() {
        
        self.designation = ""
        self.firstName = ""
        self.empID = ""
        self.lastName = ""
        self.accountNumber = ""
        self.doj = Date()
        self.salary = ""
    }
}
