import SwiftUI
 
struct TaskList: View {
    
    @Binding var taskList : [Task]
    
    @Binding var focusModeOn : Bool
    
    var body: some View {
        
        let tasksBinding = $taskList
        
        
        
        let taskIndices = taskList.indices
        let taskIndexPairs = Array(zip(taskList,taskIndices))
        
        ForEach(taskIndexPairs,id: \.0.id, content: {
            task, taskIndex in
            
            
            let theTaskBinding = tasksBinding[taskIndex]
            
            
            if focusModeOn == false || (focusModeOn && !task.isComplete){
                NavigationLink(destination: DetailView(task: theTaskBinding), label: {
                    TaskRow(task: task)
                })
            }
            
        }).onDelete { indexSet in
            taskList.remove(atOffsets: indexSet)
        }.onMove { indices, newOffset in
            taskList.move(fromOffsets: indices, toOffset: newOffset)
        }
    }
}
