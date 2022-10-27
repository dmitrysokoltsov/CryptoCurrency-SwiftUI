import SwiftUI

struct DetailView: View {
    
    let coin: Coin
    
    init(coin: Coin) {
        self.coin = coin
        print("Init DV for \(coin.name)")
    }
    
    var body: some View {
        Text(coin.name)
    }
}


