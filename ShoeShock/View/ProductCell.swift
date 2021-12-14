//
//  ProductCollectionViewCell.swift
//  ShoeShock
//
//  Created by ioannis giannakidis on 30/8/21.
//

import UIKit
protocol cellDelegate:AnyObject {
    
    func addCart(product:Product)
}

class ProductCell: UICollectionViewCell {
    
    @IBOutlet weak var productImage:UIImageView!
    
    @IBOutlet weak var productBrand:UILabel!
    
    @IBOutlet weak var productModel:UILabel!
    
    @IBOutlet weak var productPrice:UILabel!
    
    @IBOutlet weak var addToCartButton:UIButton!
    
    var product:Product!
    
    var colors:[UIColor] = [#colorLiteral(red: 1, green: 0.9999999404, blue: 0.9999999404, alpha: 1),#colorLiteral(red: 0.3411764706, green: 0.8, blue: 0.6, alpha: 1),#colorLiteral(red: 0.07058823529, green: 0.3647058824, blue: 0.5960784314, alpha: 1),#colorLiteral(red: 0.4941176471, green: 0.7098039216, blue: 0.6509803922, alpha: 1),#colorLiteral(red: 0.7647058824, green: 0.4078431373, blue: 0.2235294118, alpha: 1)]
    
    
    var delegate:cellDelegate?

 
    
   
    func updateViews(product:Product){
        
        self.product = product
        
        productImage.image = UIImage(named: product.imageName)
        
        productBrand.text = product.brand
        
        productModel.text = product.model
        
        productPrice.text = "$\(product.price)"
        
        backgroundColor = colors.randomElement()
    }
    
    @objc func addToCardTapped() {
        
        addToCartButton.setImage(UIImage(systemName: "heart.fll"), for: .normal)
        
        delegate?.addCart(product: product)
         
    }
}
