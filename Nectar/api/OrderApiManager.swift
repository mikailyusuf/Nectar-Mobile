//
//  OrderApiManager.swift
//  Nectar
//
//  Created by Mikail on 10/09/2022.
//

import Foundation
struct OrdersApiManager{
    static let shared = OrdersApiManager()
    

    func createOrder(withId id:String,completion:@escaping (Result<CreateOrderResponse,Error>)->Void){
        ApiManager.shared.createRequest(with: URL(string: Constants.BASE_URL + "api/order/\(id)"), type: .POST) { baseRequest in
            var request = baseRequest
            let task = URLSession.shared.dataTask(with: request) { data, _, error in
                guard let data = data, error == nil else{
                    return
                }
                do{
                    let result = try JSONDecoder().decode(CreateOrderResponse.self, from: data)
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
    
    
    func getAllOrder(completion:@escaping (Result<[Orders],Error>)->Void){
        ApiManager.shared.createRequest(with: URL(string: Constants.BASE_URL + "api/order/all"), type: .GET) { baseRequest in
            var request = baseRequest
            let task = URLSession.shared.dataTask(with: request) { data, _, error in
                guard let data = data, error == nil else{
                    return
                }
                do{
                    let result = try JSONDecoder().decode([Orders].self, from: data)
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
