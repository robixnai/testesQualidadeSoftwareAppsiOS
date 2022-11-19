//
//  Services.swift
//  TestesQualidadeiOS
//
//  Created by Robson Moreira on 18/11/22.
//

import Foundation

enum ChucknorrisError: Error {
    case noData
    case invalidResponse
}

protocol ServicesProtocol {
    func fetchChucknorrisCategories(completion: @escaping ([String]?, ChucknorrisError?) -> ())
}

class Services: ServicesProtocol {
    
    func fetchChucknorrisCategories(completion: @escaping ([String]?, ChucknorrisError?) -> ()) {
        guard let url = URL(string: "https://api.chucknorris.io/jokes/categories")
        else {
            return
        }
        
        URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            if error != nil {
                completion(nil, .noData)
            }
            
            if let data {
                do {
                    let categories = try JSONDecoder().decode([String].self, from: data)
                    completion(categories, nil)
                } catch {
                    completion(nil, .invalidResponse)
                }
            }
        }.resume()
    }
    
}
