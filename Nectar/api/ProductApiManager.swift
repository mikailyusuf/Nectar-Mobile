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
            
            let task = URLSession.shared.dataTask(with: baseResquest) { data, _, error in
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
    
    public func searchProducts(query:String,completion:@escaping (Result<[Product],Error>) -> Void){
        
        ApiManager.shared.createRequest(with: URL(string: Constants.BASE_URL + "api/product/find?name=\(query)"), type: .GET) { baseResquest in
            let task = URLSession.shared.dataTask(with: baseResquest) { data, _, error in
                guard let data = data, error == nil else{
                    return
                }
                do{
                    let result = try JSONDecoder().decode([Product].self, from: data)
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
