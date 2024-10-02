//
//  ProductDetailView.swift
//  ChefDelivery
//
//  Created by lgc on 01/10/24.
//

import SwiftUI

struct ProductDetailView: View {
    let product: ProductType
    @State private var productQuantity = 1
    
    var body: some View {
        
        ProductDetailHeaderView(product: product)
        
        Spacer()
        
        ProductDetailQuantityView(productQuantity: $productQuantity)
        
        Spacer()
        
        ProductDetailButtonView()
    }
}

#Preview {
    ProductDetailView(product: storesMock[0].products[0])
}
