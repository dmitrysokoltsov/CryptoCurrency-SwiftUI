import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                TopMoversView()
                                
                AllCoinsView()
            }
            .navigationTitle("Live prices")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
