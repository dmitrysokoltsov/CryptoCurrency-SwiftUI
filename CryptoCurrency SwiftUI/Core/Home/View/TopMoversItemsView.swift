import SwiftUI

struct TopMoversItemsView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Image(systemName: "bitcoinsign.circle.fill")
                .resizable()
                .frame(width: 32, height: 32)
                .foregroundColor(.orange)
            
            HStack {
                Text("BTC")
                    .font(.headline)
                
                Text("20.0000")
                    .font(.caption)
                    .foregroundColor(.secondary)
                
            }
                Text("+5.60")
                .font(.headline)
                .foregroundColor(.green)
        }
        .frame(width: 140, height: 140)
        .overlay(RoundedRectangle(cornerRadius: 10, style: .circular).stroke(LinearGradient(colors: [.yellow, .gray], startPoint: .top, endPoint: .bottom) ,lineWidth: 2))
        
    }
}

struct TopMoversItemsView_Previews: PreviewProvider {
    static var previews: some View {
        TopMoversItemsView()
    }
}
