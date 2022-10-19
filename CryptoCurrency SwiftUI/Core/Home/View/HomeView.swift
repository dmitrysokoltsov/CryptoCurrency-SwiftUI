import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel()
    @State private var showButton: Bool = true
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
//                    HeaderHomeView()
                    TopMoversView(viewModel: HomeViewModel())
                    
                    SearchBarView(text: $viewModel.serachText)
                    
                        ScrollView(.vertical, showsIndicators: false) {
                           
                            AllCoinsView(viewModel: viewModel)
                        }
                        .transition(.move(edge: .leading))
                    }
                }
            }
        }
    }

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
