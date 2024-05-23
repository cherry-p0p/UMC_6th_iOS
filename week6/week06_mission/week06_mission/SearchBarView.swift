import SwiftUI

struct SearchBarView: View {
    @State private var searchText = ""
    @State private var isSearching = false
    
    var body: some View {
        HStack {
            TextField("찾는 맛집 이름이 뭐예요?", text: $searchText)
                .frame(minHeight: 35)
                .background(Color(.white))
                .cornerRadius(5)

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


#Preview {
    SearchBarView()
}
