import SwiftUI
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var coins: [Coin] = []
    @Published var topCoinsSorted: [Coin] = []
    @Published var isLoading: Bool = false
    @Published var serachText: String = ""
    
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
        
        $serachText
            .combineLatest(dataService.$allCoins)
            .debounce(for: 0.3, scheduler: DispatchQueue.main)
            .map(filterCoins)
            .sink { [weak self] (returnedCoins) in
                self?.coins = returnedCoins
                self?.isLoading = false
            }
            .store(in: &cancellables)
    }
    
    /// Filter Coins by name,symbol,id (lower case)
    /// - Parameters:
    ///   - text: TextField search text
    ///   - coins: Coind Model
    /// - Returns: FIltered coin model
    private func filterCoins(text: String, coins: [Coin]) -> [Coin] {
        guard !text.isEmpty else {
            return coins
        }
        
        let lowecasedText = text.lowercased()
        return coins.filter { coin in
            return coin.name.lowercased().contains(lowecasedText) ||
            coin.symbol.lowercased().contains(lowecasedText) ||
            coin.id.lowercased().contains(lowecasedText)
        }
    }
    
    func configureTopMovingCoins() {
        let topMovers = coins.sorted(by: { $0.priceChangePercentage24H > $1.priceChangePercentage24H })
         
        self.topCoinsSorted = Array(topMovers.prefix(5))
    }
    
    func reloadData() {
        isLoading = true
        dataService.getCoins()
        HapticManager.notification(type: .success)
    }
}
