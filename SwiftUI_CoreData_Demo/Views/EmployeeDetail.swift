//
//  EmployeeDetail.swift
//  SwiftUI_CoreData_Demo
//
//  Created by Code Swiftly on 03/02/21.
//

import SwiftUI

struct EmployeeDetail: View {
    
    @ObservedObject var employee: Employee
    
    var body: some View {
        Text("\(employee.firstName.value)")
    }
}

struct EmployeeDetail_Previews: PreviewProvider {
    static var previews: some View {
        EmployeeDetail(employee: MockEmployeePreviewData.emp1)
    }
}
