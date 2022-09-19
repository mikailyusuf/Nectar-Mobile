//
//  BrandApiManager.swift
//  Nectar
//
//  Created by Mikail on 18/09/2022.
//

import Foundation
struct BrandApiManager{
    static let shared = BrandApiManager()
    
    func getBrands(completion:@escaping (Result<[Brand],Error>)->Void){
        let request =  ApiManager.shared.createRequest(with: URL(string: Constants.BASE_URL + "brand")!, type: .GET)
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else{
                return
            }
            do{
                let result = try JSONDecoder().decode([Brand].self, from: data)
                completion(.success(result))
            }
            catch{
                completion(.failure(error))
                print("An error occured with the request \(error)")
            }
        }
        task.resume()
        
    }
    
    
    func getBrandProducts(withBrand brand :String, completion:@escaping (Result<[Product],Error>)->Void){
        let request =  ApiManager.shared.createRequest(with: URL(string: Constants.BASE_URL + "product/brand/\(brand)")!, type: .GET)
        
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
