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
    @State  var showAlert: Bool
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
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
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Chef Delivery"), message: Text("Pedido enviado com sucesso"), dismissButton: .default(Text("Ok"), action: {
                presentationMode.wrappedValue.dismiss()
            }))
        }
    }
    
    func confirmOrder() async {
        do {
            let result = try await service.confirmOrder(product: product)
            switch result {
            case .success(let message):
                print(message)
                showAlert = true
            case .failure(let error):
                print(error.localizedDescription)
                showAlert = false
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
    ProductDetailView(product: storesMock[0].products[0], showAlert: false)
}
