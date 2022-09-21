import SwiftUI
import Kingfisher

struct AllCoinsCellView: View {
    
    let coin: Coin
    
    var body: some View {
        HStack {
            Text("\(coin.marketCapRank)")
                .font(.caption)
                .foregroundColor(.gray)
            
            KFImage(URL(string: coin.image))
                .resizable()
                .scaledToFit()
                .frame(width: 32, height: 32)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(coin.name)
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .padding(.leading, 4)
                
                Text(coin.symbol.uppercased())
                    .font(.subheadline)
                    .padding(.leading, 6)
                
            }
            .padding(.leading, 2)
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 4) {
                Text(coin.currentPrice.formattedCurrency())
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .padding(.leading, 4)
                
                Text(coin.priceChangePercentage24H.forrmattedPercentage())
                    .foregroundColor(coin.priceChangePercentage24H > 0 ? .green : .red)
                    .font(.caption)
                    .padding(.leading, 6)
            }
        }
        .padding(.horizontal, 2)
        .padding(.vertical, 4)
    }
}

//struct AllCoinsCellView_Previews: PreviewProvider {
//    static var previews: some View {
//        AllCoinsCellView()
//    }
//}
