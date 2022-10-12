//
//  SearchBarView.swift
//  CryptoCurrency SwiftUI
//
//  Created by Dmitry Sokoltsov on 11.10.2022.
//

import SwiftUI

struct SearchBarView: View {
    
    @State private var text = ""
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            TextField("Search", text: $text)
        }
        .font(.headline)
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.theme.background)
                .shadow(color: Color.theme.accent.opacity(0.15),
                        radius: 10, x: 0, y: 0)
        }
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView()
    }
}
