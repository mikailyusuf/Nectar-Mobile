//
//  GetProductResponse.swift
//  Nectar
//
//  Created by Mikail on 04/09/2022.
//

import Foundation
struct GetProductResponse:Codable{
    let latest:[Product]
    let best_selling:[Product]
    let electronics:[Product]
    
}
