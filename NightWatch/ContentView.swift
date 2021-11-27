//
//  ContentView.swift
//  NightWatch
//
//  Created by USER on 25.11.2021.
//

import SwiftUI




 

struct ContentView: View {
    
    @ObservedObject var nightWatchTasks : NightWatchTasks
    
    var body: some View {
          
        NavigationView {
            List{
                    
                
                        // MARK: Nightly  Tasks
                Section(header:TaskSectionHeader(systemName: "moon.stars", title: "Nightly Tasks")){
                  
                    TaskList(taskList: $nightWatchTasks.nightlyTasks)
                            
                        }
                        
                        // MARK: Weekly Tasks
                        Section(header:TaskSectionHeader(systemName: "sunset", title: "Weekly Tasks")){
                            
                            TaskList(taskList: $nightWatchTasks.weeklyTasks)
                            
                        }
                       
                        
                        // MARK: Monthly Tasks
                        Section(
                            header:TaskSectionHeader(systemName: "calendar", title: "MonthlyTasks")){
                                TaskList(taskList: $nightWatchTasks.monthlyTasks)
                                }
            }
            .listStyle(.grouped)
            .navigationTitle("Home")
        }
           
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let nightWatchTasks = NightWatchTasks()
        Group{
            ContentView(nightWatchTasks: nightWatchTasks)
            TaskRow(task: Task(name: "Test task", isComplete: true, lastCompleted: nil))
                .previewLayout(.fixed(width: 300, height: 70))
        }
    }
}



