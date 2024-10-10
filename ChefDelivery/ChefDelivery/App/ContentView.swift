//
//  ContentView.swift
//  ChefDelivery
//
//  Created by lgc on 21/09/24.
//

import SwiftUI

struct ContentView: View {
    
    private var service = HomeService()
    @State private var storesType: [StoreType] = []
    @State private var isLoading = true
    
    var body: some View {
        NavigationStack {
            VStack {
                
                if isLoading {
                    ProgressView()
                } else {
                    
                    NavigationBar()
                        .padding(.horizontal, 15)
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: 20) {
                            OrderTypeGridView()
                            CarouselTabView()
                            StoresContainerView(stores: storesType)
                        }
                    }
                }
            }
        }
        .onAppear{
            Task {
                await getStores()
            }
            getStoresWithAlamofire()
        }
    }
    
    func getStores() async {
        do {
            let result = try await service.fetchData()
            switch result {
            case .success(let stores):
                self.storesType = stores
                isLoading = false
            case .failure(let error):
                print(error.localizedDescription)
                isLoading = false
            }
        } catch {
            print(error.localizedDescription)
            isLoading = false
        }
    }
    
    func getStoresWithAlamofire() {
        service.fetchDataWithAlamofire { stores, error in
            print(stores)
        }
    }
    
}

#Preview {
    ContentView()
}
