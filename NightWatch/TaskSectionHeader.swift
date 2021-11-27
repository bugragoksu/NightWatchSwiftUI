import SwiftUI

struct TaskSectionHeader: View {
    
    let systemName : String
    let title : String
    
    var body: some View {
        HStack {
            Text(Image(systemName: systemName))
                .font(.title3)
                .fontWeight(.heavy)
            
            Text(title)
                .font(.title3)    
            
        }.font(.title3)
    }
}
