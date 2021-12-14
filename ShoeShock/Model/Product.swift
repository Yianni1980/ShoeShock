//
//  Product.swift
//  ShoeShock
//
//  Created by ioannis giannakidis on 30/8/21.
//

import Foundation
struct Product {
    
    var brand:String
    
     var model:String
    
     var description:String
    
     var price:Int
    
     var imageName:String
    
    
    init(brand:String,model:String,description:String,price:Int,imageName:String) {
        self.brand = brand
        self.model = model
        self.description = description
        self.price = price
        self.imageName = imageName
    }
}
