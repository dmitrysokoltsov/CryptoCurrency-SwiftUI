import SwiftUI

class HomeViewModel: ObservableObject {
    
    @Published var coins = [Coin]()
    
    init() {
        fetchCoinData()
    }
    
    func fetchCoinData() {
        let urlCoinGecho = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=true&price_change_percentage=24h"
        
        guard let url = URL(string: urlCoinGecho) else { return }
        
        URLSession.shared.dataTask(with: url) { data, respone, error in
            if let error = error {
                print("Error\(error.localizedDescription)")
                return
            }
            
            if let respone = respone as? HTTPURLResponse {
                print("Response\(respone.statusCode)")
            }
            
            guard let data = data else { return }
            
            do {
                let coins = try JSONDecoder().decode([Coin].self, from: data)
                self.coins = coins
            } catch let error {
                print("DEBUG: decoder error \(error.localizedDescription)")
            }
        }
        .resume()
    }
}
