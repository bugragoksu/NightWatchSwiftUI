//
//  NightWatchApp.swift
//  NightWatch
//
//  Created by USER on 25.11.2021.
//

import SwiftUI

@main
struct NightWatchApp: App {
    
    @StateObject private var nightWatchTasks = NightWatchTasks()
    
    var body: some Scene {
        WindowGroup {
            ContentView(nightWatchTasks: nightWatchTasks)
        }
    }
}
