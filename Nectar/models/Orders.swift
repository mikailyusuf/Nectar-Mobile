//
//  Orders.swift
//  Nectar
//
//  Created by Mikail on 10/09/2022.
//

import Foundation
struct Orders:Codable{
    let id:String
    let product_id:String
    let description:String
    let price:Double
    let image:String
    let name:String
    let is_paid:Bool
    let status:String
    let categorie:String
}
