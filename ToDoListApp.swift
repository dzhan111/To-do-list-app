//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by David on 1/10/22.
//

import SwiftUI

/*
 MVVM Model(data), view(UI), view model(manages models for view)
 
 */



@main
struct ToDoListApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .navigationViewStyle(StackNavigationViewStyle() )
            .environmentObject(listViewModel)
        }
    }
}
