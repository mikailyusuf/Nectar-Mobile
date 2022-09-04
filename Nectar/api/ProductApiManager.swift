//
//  ProductApiManager.swift
//  Nectar
//
//  Created by Mikail on 04/09/2022.
//

import Foundation
struct ProductApiManager{
    static let shared = ProductApiManager()
    
    
    public func getProducts(completion:@escaping (Result<GetProductResponse,Error>) -> Void){
        
        ApiManager.shared.createRequest(with: URL(string: Constants.BASE_URL + "api/product"), type: .GET) { baseResquest in
            
            var request = baseResquest
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            let task = URLSession.shared.dataTask(with: request) { data, _, error in
                guard let data = data, error == nil else{
                    return
                }
                do{
                    let result = try JSONDecoder().decode(GetProductResponse.self, from: data)
                    completion(.success(result))
                }
                catch{
                    completion(.failure(error))
                    print("An error occured with the request \(error)")
                }
            }
            task.resume()
        }
    }
}
