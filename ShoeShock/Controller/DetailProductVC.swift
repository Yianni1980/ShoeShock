//
//  DetailProductViewController.swift
//  ShoeShock
//
//  Created by ioannis giannakidis on 31/8/21.
//

import UIKit

class DetailProductVC: UIViewController {
    var product:Product?
    
    @IBOutlet weak var productImage:UIImageView!
    
    @IBOutlet weak var productBrand:UILabel!
    
    @IBOutlet weak var productModel:UILabel!
    
    @IBOutlet weak var productDescription:UILabel!
    
    @IBOutlet weak var productPrice:UILabel!
    
    let cart = CartService.instance

    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        loadProduct()
    }
    
    func loadProduct() {
        
        guard let product = product else {
            
            return
        }
        productImage.image = UIImage(named: product.imageName)
        
        productBrand.text = product.brand
        
        productModel.text = product.model
        
        productDescription.text = product.description
        
        productPrice.text =  "$\(product.price)"
    }

    @IBAction func addToBagPressed(_ sender: Any) {
        
        cart.addProduct(product: product!)
        
        dismiss(animated: true, completion: nil)
    }
}
