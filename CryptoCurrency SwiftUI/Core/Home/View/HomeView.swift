import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                TopMoversView(viewModel: HomeViewModel())
                
                AllCoinsView(viewModel: viewModel)
            }
            .navigationTitle("Live prices")
            .background(Color("mainColor"))
        }
    }
        
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
