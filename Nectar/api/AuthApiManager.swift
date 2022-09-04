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
        
        ApiManager.shared.createRequest(with: URL(string: Constants.BASE_URL + "api/auth/register"), type: .POST) { baseResquest in
            
            var request = baseResquest
            let json:[String:String] = ["email":user.email,"username":user.username,"password":user.password,"phone_number":user.phoneNumber]
            request.httpBody = try? JSONSerialization.data(withJSONObject: json, options: .fragmentsAllowed)
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            let task = URLSession.shared.dataTask(with: request) { data, _, error in
                guard let data = data, error == nil else{
                    return
                }
                do{
                    let result = try JSONDecoder().decode(CreateUserResponse.self, from: data)
                    completion(.success(result))
                    ApiManager.shared.accessToken = result.token
                }
                catch{
                    completion(.failure(error))
                    print("An error occured with the request \(error)")
                }
            }
            task.resume()
        }
    }
    
    
    public func loginUser(email:String,password:String,completion:@escaping (Result<LoginResponse,Error>) -> Void){
        
        ApiManager.shared.createRequest(with: URL(string: Constants.BASE_URL + "api/auth/login"), type: .POST) { baseResquest in
            
            var request = baseResquest
            let json:[String:String] = ["email":email,"password":password]
            request.httpBody = try? JSONSerialization.data(withJSONObject: json, options: .fragmentsAllowed)
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            let task = URLSession.shared.dataTask(with: request) { data, _, error in
                guard let data = data, error == nil else{
                    return
                }
                do{
                    let result = try JSONDecoder().decode(LoginResponse.self, from: data)
                    completion(.success(result))
                    ApiManager.shared.accessToken = result.token
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
