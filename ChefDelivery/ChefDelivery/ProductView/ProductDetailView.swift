//
//  ProductDetailView.swift
//  ChefDelivery
//
//  Created by lgc on 01/10/24.
//

import SwiftUI

struct ProductDetailView: View {
    
    var service = HomeService()
    let product: ProductType
    @State private var productQuantity = 1
    
    var body: some View {
        
        ProductDetailHeaderView(product: product)
        
        Spacer()
        
        ProductDetailQuantityView(productQuantity: $productQuantity)
        
        Spacer()
        
        ProductDetailButtonView{
            Task {
                await confirmOrder()
            }
        }
    }
    
    func confirmOrder() async {
        do {
            let result = try await service.confirmOrder(product: product)
            switch result {
            case .success(let message):
                print(message)
            case .failure(let error):
                print(error.localizedDescription)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}

struct ProductDetailButtonView: View {
    
    var onButtonPress: () -> Void
    
    var body: some View {
        Button {
            onButtonPress()
            
        } label: {
            HStack {
                Image(systemName: "cart")
                
                Text("Adicionar ao carrinho")
            }
            .padding(.horizontal, 32)
            .padding(.vertical, 16)
            .font(.title3)
            .bold()
            .background(Color("ColorRed"))
            .foregroundColor(.white)
            .cornerRadius(32)
            .shadow(color: Color("ColorRedDark").opacity(0.5), radius: 10, x: 6, y: 8)
        }
    }
}


#Preview {
    ProductDetailView(product: storesMock[0].products[0])
}
