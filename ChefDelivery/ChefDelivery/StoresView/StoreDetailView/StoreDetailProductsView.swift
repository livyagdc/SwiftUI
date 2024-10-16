//
//  StoreDetailProductsView.swift
//  ChefDelivery
//
//  Created by lgc on 02/10/24.
//

import SwiftUI

struct StoreDetailProductsView: View {
    
    let products: [ProductType]
    @State private var selectedProduct: ProductType?
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text("Produtos")
                .font(.title)
                .bold()
                .padding()
            
            ForEach(products) { product in
                
                Button {
                    selectedProduct = product
                } label: {
                   StoreDetailProductItemView(product: product)
                }
                .sheet(item: $selectedProduct) {product in
                    ProductDetailView(product: product, showAlert: false)
                }
            }
        }
    }
}

#Preview {
    StoreDetailProductsView(products: storesMock[0].products)
}
