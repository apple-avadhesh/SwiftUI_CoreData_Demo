//
//  ContentView.swift
//  SwiftUI_CoreData_Demo
//
//  Created by Code Swiftly on 03/02/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @EnvironmentObject var model: CreateEmployeeViewModel

    var body: some View {
        EmployessListView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(CreateEmployeeViewModel())
    }
}
