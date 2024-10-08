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
        .onAppear{fetchData()}
    }
    
    func fetchData() {
        guard let url = URL(string: "https://private-aaf161-livyagomes.apiary-mock.com/questions") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) {data, _, error in
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data) as? [[String: Any]]
                    print(json)
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
}

#Preview {
    ContentView()
}
