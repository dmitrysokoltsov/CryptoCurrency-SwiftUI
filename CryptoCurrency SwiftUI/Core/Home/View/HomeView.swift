import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel()
    @State private var showButton: Bool = true
        
    var body: some View {
        ZStack {
            VStack {
                //                HeaderHomeView()
                TopMoversView(viewModel: HomeViewModel())
                    .padding(.init(top: 0, leading: 0, bottom: -40, trailing: 0))
                SearchBarView(text: $viewModel.serachText)
                    
                List {
                        AllCoinsView(viewModel: viewModel)
                            .listRowInsets(.init(top: 0, leading: 0, bottom: 40, trailing: 0))
                }
                .listStyle(PlainListStyle())
                .refreshable {
                    viewModel.reloadData()
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
