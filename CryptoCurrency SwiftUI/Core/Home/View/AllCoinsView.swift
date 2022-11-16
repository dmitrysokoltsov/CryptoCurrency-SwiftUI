import SwiftUI

struct AllCoinsView: View {
    
    @StateObject var viewModel: HomeViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("All Coins")
                .font(.headline)
                .padding(.vertical, 10)
            HStack {
                HStack(spacing: 4) {
                    Text("Coins")
                        Image(systemName: "chevron.down")
                        .opacity( (viewModel.sortOption == .rank || viewModel.sortOption == .rankReversed) ? 1.0 : 0.0 )
                        .rotationEffect(Angle(degrees: viewModel.sortOption == .rank ? 0 : 180))
                }
                .onTapGesture {
                    withAnimation(.default) {
                        viewModel.sortOption = viewModel.sortOption == .rank ? .rankReversed : .rank
                    }
                }
                
                Spacer()
                HStack(spacing: 4) {
                    Text("Prices")
                    Image(systemName: "chevron.down")
                    .opacity( (viewModel.sortOption == .price || viewModel.sortOption == .priceReversed) ? 1.0 : 0.0 )
                    .rotationEffect(Angle(degrees: viewModel.sortOption == .price ? 0 : 180))
                }
                .onTapGesture {
                    withAnimation(.default) {
                        viewModel.sortOption = viewModel.sortOption == .price   ? .priceReversed : .price
                    }
                }
            }
            
            .font(.caption)
            .foregroundColor(.gray)
            .padding(.horizontal, 2)
            
            ScrollView {
                VStack {
                    ForEach(viewModel.coins) { coin in
                        
                        NavigationLink {
                            DetailView(coin: coin)
                        } label: {
                            AllCoinsCellView(coin: coin)
                        }

                    }
                }
            }
        }
        .padding(10)
    }
}
