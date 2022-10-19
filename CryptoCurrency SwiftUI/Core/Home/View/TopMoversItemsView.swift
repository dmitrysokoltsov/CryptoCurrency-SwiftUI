import SwiftUI
import Kingfisher

struct TopMoversItemsView: View {
    
    let coin: Coin
    
    var body: some View {
        VStack(alignment: .leading) {
            KFImage(URL(string: coin.image))
                .resizable()
                .scaledToFit()
                .frame(width: 32, height: 32)
                .foregroundColor(.orange)
            
            HStack {
                Text(coin.symbol.uppercased())
                    .font(.headline)
                
                Text(coin.currentPrice.formattedCurrency())
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            Text(coin.priceChangePercentage24H.forrmattedPercentage())
                .font(.headline)
                .foregroundColor(coin.priceChangePercentage24H > 0 ? .green : .red)
        }
        .frame(width: 140, height: 140)
    }
}
