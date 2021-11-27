import SwiftUI

struct TaskRow: View {
    let task : Task
    var body: some View {
        VStack {
            if task.isComplete {
                HStack {
                    Image(systemName: "checkmark.square")
                    Text(task.name)
                        .foregroundColor(.gray)
                        .strikethrough()
                }
                
            } else {
                HStack{
                    Image(systemName: "square")
                    Text(task.name)
                        
                }
            }
        }
    }
}
