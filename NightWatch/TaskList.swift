import SwiftUI
 
struct TaskList: View {
    
    @Binding var taskList : [Task]
    
    var body: some View {
        
        let tasksBinding = $taskList
        
        
        
        let taskIndices = taskList.indices
        let taskIndexPairs = Array(zip(taskList,taskIndices))
        
        ForEach(taskIndexPairs,id: \.0.id, content: {
            task, taskIndex in
            
            
            let theTaskBinding = tasksBinding[taskIndex]
            
            
            
            NavigationLink(destination: DetailView(task: theTaskBinding), label: {
                TaskRow(task: task)
            })
        })
    }
}
