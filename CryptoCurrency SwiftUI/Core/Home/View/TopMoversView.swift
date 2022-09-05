//
//  TopMoversView.swift
//  CryptoCurrency SwiftUI
//
//  Created by Dmitry Sokoltsov on 05.09.2022.
//

import SwiftUI

struct TopMoversView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Top Movers")
                .font(.headline)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(0..<5, id: \.self) { _ in
                        TopMoversItemsView()
                    }
                }
            }
        }
        .padding(10)
    }
}

struct TopMoversView_Previews: PreviewProvider {
    static var previews: some View {
        TopMoversView()
    }
}
