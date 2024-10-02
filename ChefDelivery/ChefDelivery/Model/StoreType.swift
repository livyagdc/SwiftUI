//
//  StoreType.swift
//  ChefDelivery
//
//  Created by lgc on 30/09/24.
//

import Foundation

struct StoreType: Identifiable {
    let id: Int
    let name: String
    let logoImage: String
    let headerImage: String
    let location: String
    let stars: Int
    let products: [ProductType]
    let distance: Double
}
