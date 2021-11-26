import SwiftUI

struct TaskSectionHeader: View {
    
    let systemName : String
    let title : String
    
    var body: some View {
        HStack {
            Text(Image(systemName: systemName))
                .foregroundColor(.yellow)
                .font(.title3)
                .fontWeight(.heavy)
            
            Text(title)
                .font(.title3)
                .foregroundColor(/*@START_MENU_TOKEN@*/.yellow/*@END_MENU_TOKEN@*/)
            
        }.font(.title3)
    }
}
