//
//  ContentView.swift
//  ChefDelivery
//
//  Created by lgc on 21/09/24.
//

import SwiftUI

struct ContentView: View {
    
    private var service = HomeService()
    
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
        .onAppear{service.fetchData()}
    }
}

#Preview {
    ContentView()
}
