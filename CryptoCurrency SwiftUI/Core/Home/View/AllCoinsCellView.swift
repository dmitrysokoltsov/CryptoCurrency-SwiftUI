import SwiftUI

struct AllCoinsCellView: View {
    var body: some View {
        HStack {
            Text("1")
                .font(.caption)
                .foregroundColor(.gray)
            
            Image(systemName: "bitcoinsign.circle.fill")
                .resizable()
                .frame(width: 32, height: 32)
                .foregroundColor(.orange)
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Bitcoin")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .padding(.leading, 4)
                
                Text("BTC")
                    .font(.subheadline)
                    .padding(.leading, 6)
                
            }
            .padding(.leading, 2)
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 4) {
                Text("$20.330.00")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .padding(.leading, 4)
                
                Text("+5.60%")
                    .foregroundColor(.green)
                    .font(.caption)
                    .padding(.leading, 6)
            }
        }
        .padding(.horizontal, 2)
        .padding(.vertical, 4)
    }
}

struct AllCoinsCellView_Previews: PreviewProvider {
    static var previews: some View {
        AllCoinsCellView()
    }
}
