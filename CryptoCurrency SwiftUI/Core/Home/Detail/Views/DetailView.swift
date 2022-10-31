import SwiftUI

struct DetailView: View {
    
    @Binding var coin: Coin?
    
    init(coin: Binding<Coin?>) {
        self._coin = coin
        print("Init DV for \(coin.wrappedValue?.name)")
    }
    
    var body: some View {
        ZStack {
            if let coin = coin {
                Text(coin.name )
            }
        }
    }
}

