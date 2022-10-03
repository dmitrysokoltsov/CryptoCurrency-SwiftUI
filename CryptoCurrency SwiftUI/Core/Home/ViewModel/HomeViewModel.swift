import SwiftUI
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var coins: [Coin] = []
    @Published var topCoinsSorted: [Coin] = []
    
    private let dataService = CoinDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        dataService.$allCoins
            .sink { [weak self] returnedCoins in
                self?.coins = returnedCoins
                self?.configureTopMovingCoins()
            }
            .store(in: &cancellables)
    }
    
    func configureTopMovingCoins() {
        let topMovers = coins.sorted(by: { $0.priceChangePercentage24H > $1.priceChangePercentage24H })
        
        self.topCoinsSorted = Array(topMovers.prefix(5))
    }
}
