import SwiftUI
import Charts
import Kingfisher

struct SelectCoinView: View {
    
    var body: some View {
        VStack {
            Image(systemName: "bitcoinsign.circle")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .foregroundColor(.orange)
            
            Text("Bitcoin")
                .font(.title)
            
            
            HStack {
                Text("$18,768.15")
                
                Text("+5.0 %")
                
                
                
            }
            .foregroundColor(.green)
            .font(.title)
            
        }
    }
}

struct SelectCoinView_Previews: PreviewProvider {
    static var previews: some View {
        SelectCoinView()
    }
}
