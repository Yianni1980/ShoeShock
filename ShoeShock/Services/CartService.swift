//
//  CartService.swift
//  ShoeShock
//
//  Created by ioannis giannakidis on 2/9/21.
//

import Foundation
class  CartService {
    
    static let instance = CartService()
    
    public var products=[SelectedProduct]()
    
    
    func addProduct(product:Product) {
        
        let selectedProduct = SelectedProduct(product: product,quantity: 1)
        
        if products.contains(selectedProduct) {
            
            let productFound = products.firstIndex(of: selectedProduct)!
            
            products[productFound].quantity += 1
            
        }else {
            
            products.append(selectedProduct)
        }
    }
    
    func removeProduct(product:Product) {
        
        if let foundProduct = products.firstIndex(where: { $0.product.model == product.model }) {
            
            products.remove(at: foundProduct)
        }
    }
    
    func getSubtotal() -> Double {
        
        var total = 0.0
        
        for x in 0..<products.count {
            
            total += Double((products[x].product.price *  products[x].quantity))
        }
        return total
    }
    
    func getMatchingProduct(selproduct: SelectedProduct?) -> SelectedProduct? {
        
        guard let selectedProduct = selproduct else { return nil }
        
        
        if let foundProduct = products.firstIndex(where: { $0.product.model ==
            
            selectedProduct.product.model }) {
            
            return products[foundProduct]
        }
        
        return nil
    }
    
    func clearCart() {
        
        products.removeAll()
    }
}
