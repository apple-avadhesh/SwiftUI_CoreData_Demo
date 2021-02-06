//
//  SwiftUI_CoreData_DemoApp.swift
//  SwiftUI_CoreData_Demo
//
//  Created by Code Swiftly on 03/02/21.
//

import SwiftUI

@main
struct SwiftUI_CoreData_DemoApp: App {
   
    @StateObject private var model = CreateEmployeeViewModel()
    let manager = CoreDataManager.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(model)
                .environment(\.managedObjectContext, manager.context)
        }
    }
}
