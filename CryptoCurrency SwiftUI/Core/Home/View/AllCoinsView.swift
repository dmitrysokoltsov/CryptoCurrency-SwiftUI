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
                Button(action: {
                    withAnimation(.linear(duration: 2.0)) {
                        viewModel.reloadData()
                    }
                    print("reload")
                }, label: {
                    Image(systemName: "goforward")
                })
                .rotationEffect(Angle(degrees: viewModel.isLoading ? 360: 0), anchor: .center)
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
