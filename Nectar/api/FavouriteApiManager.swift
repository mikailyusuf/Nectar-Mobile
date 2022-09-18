//
//  FavouriteApiController.swift
//  Nectar
//
//  Created by Mikail on 17/09/2022.
//

import Foundation

struct FavouriteApiManager{
    static let shared = FavouriteApiManager()
    
    func addFavourite(withId id:String,completion:@escaping (Result<Favourite,Error>)->Void){
        ApiManager.shared.createRequest(with: URL(string: Constants.BASE_URL + "api/favourite/\(id)"), type: .POST) { baseRequest in
          
            let task = URLSession.shared.dataTask(with: baseRequest) { data, _, error in
                guard let data = data, error == nil else{
                    return
                }
                do{
                    let result = try JSONDecoder().decode(Favourite.self, from: data)
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
    
    
    func getAllFavourites(completion:@escaping (Result<[Favourite],Error>)->Void){
        ApiManager.shared.createRequest(with: URL(string: Constants.BASE_URL + "api/favourite/all"), type: .GET) { baseRequest in
           
            let task = URLSession.shared.dataTask(with: baseRequest) { data, _, error in
                guard let data = data, error == nil else{
                    return
                }
                do{
                    let result = try JSONDecoder().decode([Favourite].self, from: data)
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
