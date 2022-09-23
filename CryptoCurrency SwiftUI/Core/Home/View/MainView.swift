import SwiftUI

struct MainView: View {
    
    @State private var showButton: Bool = true
    
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
            VStack {
                header
                Spacer(minLength: 0)
            }
        }
    }
}

extension MainView {
    
    private var header: some View {
        HStack {
            withAnimation(.none) {
                TopButtonView(iconName: showButton ? "plus" : "info")
                    .background(TopButtonAnimationView(animation: $showButton))
            }
            Spacer()
            Text("Live Prices")
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(Color.theme.accent)
            
            Spacer()
            TopButtonView(iconName: "chevron.right")
                .rotationEffect(Angle(degrees: showButton ? 180 : 0))
                .onTapGesture {
                    withAnimation(.spring()) {
                        showButton.toggle()
                    }
                }
        }
        .padding(.horizontal)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MainView()
        }
    }
}
