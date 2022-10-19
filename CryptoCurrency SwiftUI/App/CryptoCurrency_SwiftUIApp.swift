import SwiftUI

@main
struct CryptoCurrency_SwiftUIApp: App {
    
    @StateObject private var vm = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
                HomeView()
            }
        }
    }
