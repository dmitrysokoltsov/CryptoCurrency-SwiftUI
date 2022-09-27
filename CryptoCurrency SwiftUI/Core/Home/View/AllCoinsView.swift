import SwiftUI

struct AllCoinsView: View {
    
    @StateObject var viewModel: HomeViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("All Coins")
                .font(.headline)
                .padding(.vertical, 10)
            HStack {
                Text("Coins")
                
                Spacer()
                
                Text("Prices")
            }
            .font(.caption)
            .foregroundColor(.gray)
            .padding(.horizontal, 2)
            
            ScrollView {
                VStack {
                    ForEach(viewModel.coins) { coin in
//                        NavigationLink {
//                            SelectCoinView(coin: coin)
//                        } label: {
//                             AllCoinsCellView(coin: coin)
//
//                        }
//                        .buttonStyle(.plain)
                        AllCoinsCellView(coin: coin)
                    }
                }
            }
        }
        .padding(10)
    }
}
