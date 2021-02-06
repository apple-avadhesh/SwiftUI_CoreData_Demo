//
//  EmployessListView.swift
//  SwiftUI_CoreData_Demo
//
//  Created by Code Swiftly on 03/02/21.
//

import SwiftUI

struct EmployessListView: View {
    
    @FetchRequest(fetchRequest: Employee.empFetchRequest)
    
    var employees: FetchedResults<Employee>
    
    @State var showCreateEmployeeScreen = false
    
    let model = CreateEmployeeViewModel()
    
    var body: some View {

        NavigationView {
            ScrollView(.vertical) {
                LazyVStack(alignment: .center, spacing: 15) {
                    ForEach(employees) { emp in
                        NavigationLink(destination: EmployeeDetail(employee: emp)) {
                            EmployeeCell(emp: emp)
                        }
                    }
                }
                .padding(EdgeInsets(top: 44, leading: 15, bottom: 24, trailing: 15))
                        .edgesIgnoringSafeArea(.all)
            }
            
            .sheet(isPresented: $showCreateEmployeeScreen) {
                CreateEmployeeView().environmentObject(self.model)
            }
            .navigationBarTitle("Employees")
            .navigationBarItems(trailing: Button("Add Employee", action: {
                self.showCreateEmployeeScreen.toggle()
            }))
        }
    }
}

struct EmployessListView_Previews: PreviewProvider {
    static var previews: some View {
        EmployessListView() .environment(\.managedObjectContext, MockEmployeePreviewData.moc)
    }
}
