//
//  ContentView.swift
//  NightWatch
//
//  Created by USER on 25.11.2021.
//

import SwiftUI






struct ContentView: View {
    
    @ObservedObject var nightWatchTasks : NightWatchTasks
        
    @State private var focusModeOn = false
    
    @State private var showAlert = false
    
    var body: some View {
        
        NavigationView {
            List{
                
                
                // MARK: Nightly  Tasks
                Section(header:TaskSectionHeader(systemName: "moon.stars", title: "Nightly Tasks")){
                    
                    TaskList(taskList: $nightWatchTasks.nightlyTasks,focusModeOn: $focusModeOn)
                    
                }
                
                // MARK: Weekly Tasks
                Section(header:TaskSectionHeader(systemName: "sunset", title: "Weekly Tasks")){
                    
                    TaskList(taskList: $nightWatchTasks.weeklyTasks,focusModeOn: $focusModeOn)
                    
                }
                
                
                // MARK: Monthly Tasks
                Section(
                    header:TaskSectionHeader(systemName: "calendar", title: "MonthlyTasks")){
                        TaskList(taskList: $nightWatchTasks.monthlyTasks,focusModeOn: $focusModeOn)
                    }
            }
            .listStyle(.grouped)
            .navigationTitle("Home")
            .toolbar {
                
                ToolbarItem(placement:.navigationBarLeading){
                    EditButton()
                }
                ToolbarItem(placement:.navigationBarTrailing){
                    Button("Reset"){
                            showAlert = true
                    }
                }
                
               
                ToolbarItem(placement:.bottomBar ){
                    Toggle("Focus Mode",isOn: $focusModeOn)
                        .toggleStyle(.switch)
                
                }
            }
        }.alert(isPresented: $showAlert) {
            Alert(title: Text("Reset List"), message: Text("Are you sure?"), primaryButton: .cancel(), secondaryButton: .destructive(Text("Yes, reset it"), action: {
                let newTasks = NightWatchTasks()
                
                self.nightWatchTasks.nightlyTasks = newTasks.nightlyTasks
                self.nightWatchTasks.weeklyTasks = newTasks.weeklyTasks
                self.nightWatchTasks.monthlyTasks = newTasks.monthlyTasks
            }))
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



