//
//  HomeService.swift
//  ChefDelivery
//
//  Created by lgc on 08/10/24.
//

import Foundation
import Alamofire

enum RequestError: Error {
    case invalidURL
    case errorRequest(error: String)
}

struct HomeService {
    func fetchData() async throws -> Result<[StoreType], RequestError> {
        guard let url = URL(string: "https://private-aaf161-livyagomes.apiary-mock.com/home") else {
            return .failure(.invalidURL)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let(data, _) = try await URLSession.shared.data(for: request)
        let storesObjects = try JSONDecoder().decode([StoreType].self, from: data)
        
        return .success(storesObjects)
    }
    
    func confirmOrder(product: ProductType) async throws -> Result<[String: Any]?, RequestError> {
        guard let url = URL(string: "https://private-aaf161-livyagomes.apiary-mock.com/home") else {
            return .failure(.invalidURL)
        }
        
        let encodedObject = try JSONEncoder().encode(product)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = encodedObject
        
        let(data, _) = try await URLSession.shared.data(for: request)
        let message = try JSONSerialization.jsonObject(with: data) as? [String: Any]
        
        return .success(message)
        
    }
    
    func fetchDataWithAlamofire(completion: @escaping ([StoreType]?, Error?) -> Void) {
        AF.request("https:/co/private-aaf161-livyagomes.apiary-mock.com/home").responseDecodable(of: [StoreType].self) { response in
            switch response.result {
            case .success(let stores):
                completion(stores, nil)
            default: break
            }
        }
    }
    
}


//      URLSession.shared.dataTask(with: url) {data, _, error in
//            if let error = error {
//                print(error.localizedDescription)
//            } else if let data = data {
//                let storesObjects = try? JSONDecoder().decode([StoreType].self, from: data)
//                print(storesObjects)
//            }
//        }.resume()
