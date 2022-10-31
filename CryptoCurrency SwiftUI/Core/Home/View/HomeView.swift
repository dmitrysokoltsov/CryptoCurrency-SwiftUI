import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel()
    @State private var showButton: Bool = true
    
    @State private var selectedCoin: Coin? = nil
    @State private var showDetailView: Bool = false
    
    var body: some View {
        ZStack {
            VStack {
                HeaderHomeView()
                TopMoversView(viewModel: HomeViewModel())
                
                SearchBarView(text: $viewModel.serachText)
                
                List {
                    ForEach(viewModel.coins) { coin in
                        AllCoinsView(viewModel: viewModel)
                            .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 0))
                            .onTapGesture {
                                segue(coin: coin)
                            }
                    }
                }
                .listStyle(PlainListStyle())
                .refreshable {
                    viewModel.reloadData()
                }
                
            }
        }
        .sheet(isPresented: $showDetailView) {
            DetailView(coin: $selectedCoin)
        }
    }
    
    private func segue(coin: Coin) {
        selectedCoin = coin
        showDetailView.toggle()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
