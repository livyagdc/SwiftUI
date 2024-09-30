//
//  ContentView.swift
//  ChefDelivery
//
//  Created by lgc on 21/09/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
                NavigationBar()
                    .padding(.horizontal, 15)
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 20) {
                        OrderTypeGridView()
                        CarouselTabView()
                        StoresContainerView()
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
