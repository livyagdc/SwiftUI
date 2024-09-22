//
//  OrderTypeGridView.swift
//  ChefDelivery
//
//  Created by lgc on 21/09/24.
//
// Grid - renderiza tudo e o lazy grid rendereza conforme vai aparecendo na tela

import SwiftUI

struct OrderTypeGridView: View {
    
    let orders = ["Restaurantes", "Farmácia", "Descontos", "Gourmet", "Mercados", "Pet", "Bebidas"]
    
    var body: some View {
        LazyHGrid(rows: [
            GridItem(.fixed(100)),
            GridItem(.fixed(100))
        ]) {
            ForEach(ordersMock) { orderItem in
                Text(orderItem.name)
            }
        }
    }
}

#Preview {
    OrderTypeGridView()
}
