//
//  BaseService.swift
//  MVVM-POC
//
//  Created by Bernardo Silva on 01/04/20.
//  Copyright © 2020 Bernardo. All rights reserved.
//

import Foundation

class BaseService {
    
    func request<T: Codable>(router: Router, completion: @escaping (Result<T, Error>) -> ()) {
        // 2.
        var components = URLComponents()
        components.scheme = "https"
        components.host = router.host
        components.path = router.path
        components.queryItems = router.parameters
        // 3.
        guard let url = components.url else { return }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = router.method
        // 4.
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: urlRequest) { data, response, error in
            // 5.
            guard let data = data,  error == nil else {
                completion(.failure(error!))
                print(error?.localizedDescription ?? "")
                return
            }
            
            let responseObject = try! JSONDecoder().decode(T.self, from: data)
   
            completion(.success(responseObject))
            
        }
        dataTask.resume()
    }
}
