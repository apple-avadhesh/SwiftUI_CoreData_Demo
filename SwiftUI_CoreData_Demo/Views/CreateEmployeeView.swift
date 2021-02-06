//
//  CreateEmployeeView.swift
//  SwiftUI_CoreData_Demo
//
//  Created by Code Swiftly on 04/02/21.
//

import SwiftUI

struct CreateEmployeeView: View {
    
    @EnvironmentObject var model: CreateEmployeeViewModel
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        
        List {
            Text("Create an Employee")
                .font(Font.system(size: 24.0))
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(Color.blue)
                .multilineTextAlignment(.trailing)
            
            HStack {
                Text("First Name")
                    .bold()
                Spacer()
                TextField("Enter First Name", text: $model.firstName)
                    .multilineTextAlignment(.trailing)
            }
            
            HStack {
                Text("Last Name")
                    .bold()
                Spacer()
                TextField("Enter Last Name", text: $model.lastName)
                    .multilineTextAlignment(.trailing)
            }
            
            HStack {
                DatePicker("When is your birthday?", selection: $model.doj, displayedComponents: .date)
                    .font(Font.body.bold())
            }
            
            HStack {
                Text("Account Number")
                    .bold()
                Spacer()
                TextField("Enter Account Number", text: $model.accountNumber)
                    .multilineTextAlignment(.trailing)
            }
            
            HStack {
                Text("Salary")
                    .bold()
                Spacer()
                TextField("Enter Salary", text: $model.salary)
                    .multilineTextAlignment(.trailing)
                    .keyboardType(.numberPad)
            }
            
            HStack {
                Text("Designation")
                    .bold()
                Spacer()
                TextField("Enter Designation", text: $model.designation)
                    .multilineTextAlignment(.trailing)
            }
        }
        btnCreateEmployee
        Spacer(minLength: 20.0)

    }
    
    var btnCreateEmployee: some View {
        Button(action: {
            self.onCreateTapped()
            self.presentationMode.wrappedValue.dismiss()
        }) {
            ZStack {
                Text("Create Employee")
                    .frame(width: 300, height: 40)
                    .background(Color.blue)
                    .cornerRadius(8)
                    .foregroundColor(Color.white)
            }
        }
    }
    
    func onCreateTapped() {
        model.createEmployee()
    }
    
}

struct CreateEmployeeView_Previews: PreviewProvider {
    static var previews: some View {
        CreateEmployeeView()
    }
}
