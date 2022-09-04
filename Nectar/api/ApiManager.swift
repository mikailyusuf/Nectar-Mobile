//
//  AuthApiManager.swift
//  Nectar
//
//  Created by Mikail on 23/07/2022.
//

import Foundation
struct ApiManager{
    static  var shared = ApiManager()
   
    func createRequest(with url:URL?,type:HTTPMethod,completion:@escaping(URLRequest)->Void){
        
        guard let apiUrl = url else{return}
        
        var request = URLRequest(url: apiUrl)
        request.httpMethod = type.rawValue
        request.timeoutInterval = 60
        request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "token")
        completion(request)
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
