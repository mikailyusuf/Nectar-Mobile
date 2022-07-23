//
//  AuthApiManager.swift
//  Nectar
//
//  Created by Mikail on 23/07/2022.
//

import Foundation
struct AuthApiManager{
   static  let shared = AuthApiManager()
    
    struct Constants {
        static let BASE_URL = ""
    }
    
    func createRequest(wuth url:URL?,type:HTTPMethod,completion:@escaping(URLRequest)->Void){
        
        guard let apiUrl = url else{return}
        
        var request = URLRequest(url: apiUrl)
        request.httpMethod = type.rawValue
        request.timeoutInterval = 60
        request.setValue("Bearer \(123)", forHTTPHeaderField: "Authorisation")
        completion(request)
    }
    
    func setoken(withToken token:String){
        UserDefaults.standard.setValue(token, forKey: "access_token")
    }
    
    
    private var acccessToken:String?{
        return UserDefaults.standard.string(forKey: "access_token")
    }
    
    
    enum HTTPMethod:String{
        case GET
        case POST
        case UPDATE
        case DELETE
    }
}
