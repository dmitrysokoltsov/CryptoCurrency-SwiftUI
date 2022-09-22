import SwiftUI

struct MainView: View {
    
    @State private var showButton: Bool = false
    
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    TopButtonView(iconName: "info")
                    Spacer()
                    Text("Live Prices")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(Color.theme.accent)
                        
                    Spacer()
                    TopButtonView(iconName: "chevron.right")
                }
                .padding(.horizontal)
                Spacer(minLength: 0)
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MainView()
        }
    }
}
