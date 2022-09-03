//
//  CreateUserResponse.swift
//  Nectar
//
//  Created by Mikail on 03/09/2022.
//

import Foundation
struct CreateUserResponse:Codable{
    let success:Bool
    let message:String
    let token:String
}
