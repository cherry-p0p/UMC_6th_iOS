import SwiftUI

struct TopView: View {
    var body: some View {
        HStack {
            Text("광명동").padding(.leading, 20).font(.system(size: 20, weight: .bold))
            Text(Image(systemName: "chevron.down")).font(.system(size: 20, weight: .medium))

            Spacer()
            
            Text(Image(systemName: "list.bullet")).font(.system(size: 20, weight: .medium))
            Text(Image(systemName: "magnifyingglass")).font(.system(size: 20, weight: .medium))
            Text(Image(systemName: "bell")).padding(.trailing, 20).font(.system(size: 20, weight: .medium))

        }
        Spacer()
    }
    
}

#Preview {
    TopView()
}
