import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel()
    @State private var showButton: Bool = true
    
    @State var showDetailView: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    //                    HeaderHomeView()
                    TopMoversView(viewModel: HomeViewModel())
                    
                    SearchBarView(text: $viewModel.serachText)
                    
                    List {
                        ForEach(viewModel.coins) { coin in
                            AllCoinsView(viewModel: viewModel)
                                .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 0))
                         
                        }
                    }
                    .listStyle(PlainListStyle())
                    .refreshable {
                        viewModel.reloadData()
                    }
                    
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
