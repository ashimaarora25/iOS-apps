//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by ashima arora on 11/30/24.
//

import FirebaseCore
import SwiftUI

@main
struct ToDoListApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
