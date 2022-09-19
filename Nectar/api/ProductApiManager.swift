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
        
        let request = ApiManager.shared.createRequest(with: URL(string: Constants.BASE_URL + "product")!, type: .GET)
        
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
    
    public func searchProducts(query:String,completion:@escaping (Result<[Product],Error>) -> Void){
        
        let request = ApiManager.shared.createRequest(with: URL(string: Constants.BASE_URL + "product/find?name=\(query)")!, type: .GET)
            let task = URLSession.shared.dataTask(with: request) { data, _, error in
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
