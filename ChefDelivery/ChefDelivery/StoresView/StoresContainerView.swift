//
//  StoresContainerView.swift
//  ChefDelivery
//
//  Created by lgc on 23/09/24.
//

import SwiftUI

struct StoresContainerView: View {
    
    let title = "Lojas"
    @State private var ratingFilter = 0
    @State private var minDistance = 0
    @State private var maxDistance = 25
    let distances = [0, 5, 10, 15, 20, 25]
    
    var filteredStores: [StoreType] {
        return storesMock.filter { store in
            store.stars >= ratingFilter &&
            store.distance >= Double(minDistance) &&
            store.distance <= Double(maxDistance)
        }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(title)
                    .font(.headline)
                
                Spacer()
                
                // Inicio Menu Estrelas
                Menu("Estrelas"){
                    
                    Button {
                        ratingFilter = 0
                    } label: {
                        Text("Limpar filtro")
                    }
                    
                    Divider()
                    
                    ForEach (1...5, id: \.self) { rating in
                        Button {
                            ratingFilter = rating
                        } label: {
                            if rating > 1 {
                                Text("\(rating) estrelas ou mais")
                            } else {
                                Text("\(rating) estrela ou mais")
                            }
                        }
                    }
                }
                // Fim Menu Estrelas
                
                Menu("Distância") {
                    
                    Button {
                        minDistance = 0
                        maxDistance = 25
                    } label: {
                        Text("Limpar filtro")
                    }
                    
                    Divider()
                    
                    ForEach(0...4, id:  \.self) { index in
                        let indexPlus = index + 1
                        Button {
                            minDistance = distances[index]
                            maxDistance = distances[indexPlus]
                        } label: {
                            Text("De \(distances[index]) até \(distances[indexPlus]) km ")
                        }
                    }
                }
            }
            
            VStack(alignment: .leading, spacing: 30) {
                if filteredStores.isEmpty {
                    Text("Nenhum resultado encontrado.")
                        .font(.title2)
                        .bold()
                        .foregroundColor(Color("ColorRed"))
                        .padding(.vertical, 32)
                        .frame(maxWidth: .infinity)
                } else {
                    ForEach(filteredStores) { mock in
                        NavigationLink {
                            StoreDetailView(store: mock)
                        } label: {
                            StoreItemView(store: mock)
                        }
                    }
                }

            }
            .foregroundColor(.black)
        }
        .padding(20)
    }
}

#Preview {
    StoresContainerView()
        .previewLayout(.sizeThatFits)
}
