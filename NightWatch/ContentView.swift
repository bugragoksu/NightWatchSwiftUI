//
//  ContentView.swift
//  NightWatch
//
//  Created by USER on 25.11.2021.
//

import SwiftUI

let nightlyTasks = [
    "Check all windows",
    "Check all doors",
    "Check that the safe is locked",
    "Check the mailbox",
    "Inspect security cameras",
    "Clear ice from sidewalks",
    "Document \"strange and unsual\" occurences"
]

let weeklyTasks = [
   "Check inside all vacant rooms",
   "Walk the perimeter of property"
]

let monthlyTasks = [
    "Test security alarm",
    "Test motion detectors",
    "Test smoke alarms"
]


func getTextList(textList : [String]) ->some View{
    ForEach(textList, id: \.self, content: {
        text in
        NavigationLink(text,destination: Text(text))
    })
}

struct ContentView: View {
    
   
    
    var body: some View {
        
        NavigationView {
            List{
                        // MARK: Nightly  Tasks
                Section(header:TaskSectionHeader(systemName: "moon.stars", title: "Nightly Tasks")){
                  
                    TaskList(taskList: nightlyTasks)
                            
                        }
                        
                        // MARK: Weekly Tasks
                        Section(header:TaskSectionHeader(systemName: "sunset", title: "Weekly Tasks")){
                            
                            TaskList(taskList: weeklyTasks)
                            
                        }
                       
                        
                        // MARK: Monthly Tasks
                        Section(
                            header:TaskSectionHeader(systemName: "calendar", title: "MonthlyTasks")){
                                TaskList(taskList: monthlyTasks)
                                }
            }
            .listStyle(.grouped)
            .navigationTitle("Home")
        }
           
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



