//
//  CourelItemView.swift
//  ChefDelivery
//
//  Created by lgc on 23/09/24.
//

import SwiftUI

struct CarouselItemView: View {
    
    let  order:  OrderType
    
    var body: some View {
        Image(order.image)
            .resizable()
            .scaledToFit()
    }
}

#Preview {
    CarouselItemView(order: OrderType(id: 1, name: "", image: "barbecue-banner"))
        .previewLayout(.sizeThatFits)
        .padding()
}
