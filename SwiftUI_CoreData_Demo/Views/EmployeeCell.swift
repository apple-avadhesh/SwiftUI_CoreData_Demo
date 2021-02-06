//
//  EmployeeCell.swift
//  SwiftUI_CoreData_Demo
//
//  Created by Code Swiftly on 03/02/21.
//

import SwiftUI

struct EmployeeCell: View {
    
    @ObservedObject var emp: Employee

    var body: some View {
           ZStack {
               Color.white
                   .cornerRadius(12)
            ShadowView(emp: emp)
           }
           .fixedSize(horizontal: false, vertical: true)
           .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
       }
}

struct EmployeeCell_Previews: PreviewProvider {
    static var previews: some View {
        EmployeeCell(emp: MockEmployeePreviewData.emp1)
    }
}

struct ShadowView: View {
    @ObservedObject var emp: Employee

    var body: some View {
        VStack(spacing: 20.0) {
            HStack() {
                Text(getFullName())
                    .font(Font.body.bold())
                    .foregroundColor(Color.blue)
                Spacer()
                Text(emp.designation.value)
                    .font(Font.body.bold())
                    .foregroundColor(Color.black)
            }
            HStack() {
                Text((emp.joiningDate ?? Date()).dateToString())
                    .font(Font.body.bold())
                    .foregroundColor(Color.black)

                Spacer()
                Text(getSalary())
                    .multilineTextAlignment(.trailing)
                    .font(Font.body.bold())
                    .foregroundColor(Color.black)

            }
        }
        .padding()
    }
    
    private func getFullName() -> String {
        return "\(emp.firstName.value) \(emp.lastName.value)"
    }
    
    private func getSalary() -> String {
        guard let account = emp.account else {
            return "$0.0"
        }
        
        return account.displaySalary
    }
}
