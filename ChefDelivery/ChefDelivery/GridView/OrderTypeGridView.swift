//
//  OrderTypeGridView.swift
//  ChefDelivery
//
//  Created by lgc on 21/09/24.
//
// Grid - renderiza tudo e o lazy grid rendereza conforme vai aparecendo na tela

import SwiftUI

struct OrderTypeGridView: View {
    
    var gridLayout: [GridItem] {
        return Array(repeating: GridItem(.flexible(), spacing: 10), count: 2)
    }
    
    var body: some View {
        LazyHGrid(rows: gridLayout, spacing: 15) {
            ForEach(ordersMock) { orderItem in
                OrderTypeView(orderType: orderItem)
            }
        }
        .frame(height: 200)
        .padding(.horizontal, 15)
        .padding(.top, 15)
    }
}

#Preview {
    OrderTypeGridView()
        .previewLayout(.sizeThatFits)
}
