//
//  CartCell.swift
//  ShoeShock
//
//  Created by ioannis giannakidis on 2/9/21.
//

import UIKit
protocol TableViewUpdater {
    func updateTableView()
}

class CartCell: UITableViewCell {
    
    @IBOutlet weak var productImage:UIImageView!
    
    @IBOutlet weak var productModel:UILabel!
    
    @IBOutlet weak var productPrice:UILabel!
    
    @IBOutlet weak var quantinyOfProducts:UILabel!
    
    @IBOutlet weak var quantityStepper:UIStepper!
    
    var cart = CartService.instance
    
    var selectedProduct:SelectedProduct!
    
    var delegate: TableViewUpdater?
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
        
    }
    
    func initCell(selProduct:SelectedProduct) {
        
        self.selectedProduct = selProduct
        
        quantityStepper.addTarget(self, action: #selector(onStepperChanged), for: .valueChanged)
        
        quantityStepper.value = Double(selProduct.quantity)
        
        productImage.image = UIImage(named: selProduct.product.imageName)
        
        productModel.text = selProduct.product.model
        
        productPrice.text = "$\(selProduct.product.price * selProduct.quantity)"
        
        quantinyOfProducts.text = "\(selProduct.quantity)"
    }
    
    @objc func onStepperChanged(stepper:UIStepper) {
        
        guard let selectedProduct = cart.getMatchingProduct(selproduct: selectedProduct) else
            
        {return}
        
        selectedProduct.quantity = Int(stepper.value)
        
        let quantity = selectedProduct.quantity
        
        if quantity == 0 {
            
            cart.removeProduct(product: selectedProduct.product)
            
        }else {
            
            quantinyOfProducts.text = "\(selectedProduct.quantity)"
            
            productPrice.text = "$\(selectedProduct.quantity * selectedProduct.product.price)"
        }
        
        delegate?.updateTableView()
        
  
    }
}
