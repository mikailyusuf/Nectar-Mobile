//
//  AuthApiManager.swift
//  Nectar
//
//  Created by Mikail on 03/09/2022.
//

import Foundation

struct AuthApiManager{
    static let shared = AuthApiManager()
    
    
    public func createUser(with user:User,completion:@escaping (Result<CreateUserResponse,Error>) -> Void){
        
        var request = ApiManager.shared.createRequest(with: URL(string: Constants.BASE_URL + "auth/register")!, type: .POST)
        
            let json:[String:String] = ["email":user.email,"username":user.username,"password":user.password,"phone_number":user.phoneNumber]
            request.httpBody = try? JSONSerialization.data(withJSONObject: json, options: .fragmentsAllowed)
            let task = URLSession.shared.dataTask(with: request) { data, _, error in
                guard let data = data, error == nil else{
                    completion(.failure(error!))
                    return
                }
                do{
                    let result = try JSONDecoder().decode(CreateUserResponse.self, from: data)
                    ApiManager.shared.accessToken = result.token
                    completion(.success(result))
                }
                catch{
                    guard let errroMessage = try? JSONDecoder().decode(ErrorResponse.self, from: data) else {
                        return
                    }
                    completion(.failure(ApiError(message: errroMessage.message)))
                }
            }
            task.resume()
        
    }
    
    
    public func loginUser(email:String,password:String,completion:@escaping (Result<LoginResponse,Error>) -> Void){
        
        var request = ApiManager.shared.createRequest(with: URL(string: Constants.BASE_URL + "auth/login")!, type: .POST)

            let json:[String:String] = ["email":email,"password":password]
            request.httpBody = try? JSONSerialization.data(withJSONObject: json, options: .fragmentsAllowed)
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data, error == nil else{
                    completion(.failure(error!))
                   
                    return
                }
                do{
                    let result = try JSONDecoder().decode(LoginResponse.self, from: data)
                    ApiManager.shared.accessToken = result.token
                    completion(.success(result))
                  
                }
                catch{
                    guard let errroMessage = try? JSONDecoder().decode(ErrorResponse.self, from: data) else {
                        return
                    }
                    completion(.failure(ApiError(message: errroMessage.message)))
                    
                }
            }
            task.resume()
        }
    
}
