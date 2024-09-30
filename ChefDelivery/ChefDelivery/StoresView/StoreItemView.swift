//
//  StoreItemView.swift
//  ChefDelivery
//
//  Created by lgc on 23/09/24.
//

import SwiftUI

struct StoreItemView: View {
    
    let store: StoreType
    
    var body: some View {
        HStack {
            Image(store.logoImage)
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
            
            VStack {
                Text(store.name)
                    .font(.subheadline)
            }
            
            Spacer()
        }
    }
}

#Preview {
    StoreItemView(store: storesMock[0])
        .previewLayout(.sizeThatFits)
}
