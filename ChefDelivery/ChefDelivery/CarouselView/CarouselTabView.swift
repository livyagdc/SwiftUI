//
//  CarouselTabView.swift
//  ChefDelivery
//
//  Created by lgc on 23/09/24.
//

import SwiftUI

struct CarouselTabView: View {
    
    let ordersMock: [OrderType] = [
        OrderType(id: 1, name: "banner burguer", image: "barbecue-banner"),
        OrderType(id: 2, name: "banner prato feito", image: "brazilian-meal-banner"),
        OrderType(id: 3, name: "banner poke", image: "pokes-banner")
    ]
    
    var body: some View {
        TabView {
            ForEach(ordersMock) { mock in CarouselItemView(order: mock)
                
            }
        }
        .frame(height: 200)
        .tabViewStyle(.page(indexDisplayMode: .always))
    }
}

#Preview {
    CarouselTabView()
}
