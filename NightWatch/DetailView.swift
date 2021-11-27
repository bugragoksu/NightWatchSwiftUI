
import SwiftUI


struct DetailView : View{
    @Binding var task : Task
    var body: some View{
        VStack{
            Text(task.name)
            Text("Placeholder for task description")
            Button("Mark Complete"){
                task.isComplete = true
            }
        }
    }
}

struct Detailview_Previews : PreviewProvider{
    static var previews: some View{
        DetailView(task: Binding<Task>.constant(Task(name: "Test task", isComplete: false, lastCompleted: nil)))
    }
}
