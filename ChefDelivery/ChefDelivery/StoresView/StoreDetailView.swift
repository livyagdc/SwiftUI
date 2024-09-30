//
//  StoreDetailView.swift
//  ChefDelivery
//
//  Created by lgc on 30/09/24.
//

import SwiftUI

struct StoreDetailView: View {
    let store: StoreType
    
    var body: some View {
        Text(store.name)
    }
}

#Preview {
    StoreDetailView(store: storesMock[0])
}
