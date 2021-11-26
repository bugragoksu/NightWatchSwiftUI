import SwiftUI

struct TaskList: View {
    
    let taskList : [String]
    
    var body: some View {
        ForEach(taskList, id: \.self, content: {
            text in
            NavigationLink(text,destination: DetailView(text: text))
        })
    }
}
