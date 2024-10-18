//
//  HTTPClient.swift
//  Vollmed
//
//  Created by lgc on 18/10/24.
//

import Foundation

protocol HTTPClient {
    func sendRequest<T: Decodable>(endpoint: Endpoint, responseModel: T.Type) async -> Result<T, RequestError>
}
