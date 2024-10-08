//
//  HomeService.swift
//  ChefDelivery
//
//  Created by lgc on 08/10/24.
//

import Foundation

struct HomeService {
    func fetchData() {
        guard let url = URL(string: "https://private-aaf161-livyagomes.apiary-mock.com/home") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) {data, _, error in
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                let storesObjects = try? JSONDecoder().decode([StoreType].self, from: data)
                print(storesObjects)
            }
        }.resume()
    }
}
