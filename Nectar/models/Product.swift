//
//  Product.swift
//  Nectar
//
//  Created by Mikail on 06/08/2022.
//

import Foundation
struct Product:Codable{
    let id:String
    let description:String
    let name:String
    let price:Double
    let categorie:String
    let image:String
    let available_quantity:Int
    let unit_description:String
    let is_available:Bool
}
