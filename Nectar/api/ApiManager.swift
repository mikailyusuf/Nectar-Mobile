//
//  AuthApiManager.swift
//  Nectar
//
//  Created by Mikail on 23/07/2022.
//

import Foundation
struct ApiManager{
    static  var shared = ApiManager()
   
    func createRequest(with url:URL,type:HTTPMethod)->URLRequest{
  
        var request = URLRequest(url: url)
        request.httpMethod = type.rawValue
        request.timeoutInterval = 60
        request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        return request
    }

    var accessToken:String {
        get{
            guard let token = UserDefaults.standard.string(forKey: Constants.ACCESS_TOKEN) else{
                return ""
            }
            return token
            
        }
        set(token){
            UserDefaults.standard.setValue(token, forKey: Constants.ACCESS_TOKEN)
        }
    }
    
    
    enum HTTPMethod:String{
        case GET
        case POST
        case UPDATE
        case DELETE
    }
}
