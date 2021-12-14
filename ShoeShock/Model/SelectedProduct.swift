//
//  SelectedProduct.swift
//  ShoeShock
//
//  Created by ioannis giannakidis on 2/9/21.
//

import Foundation
class SelectedProduct: Equatable {
    
    static func == (lhs: SelectedProduct, rhs: SelectedProduct) -> Bool {
        
        return lhs.product.model == rhs.product.model
        
    }
    
    var product:Product
    
    var quantity = 0
    
    var totalCost = 0.0
    
    init(product:Product,quantity:Int) {
        
        self.product = product
        
        self.quantity = quantity
        
    }
    func calculateTotal() {
        
        totalCost = Double(product.price) * Double(quantity)
    }
}
