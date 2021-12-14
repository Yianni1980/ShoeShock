//
//  ProductsVC.swift
//  ShoeShock
//
//  Created by ioannis giannakidis on 30/8/21.
//

import UIKit

class ProductsVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    
    
    
    
    @IBOutlet weak var productsCollection:UICollectionView!
    
    @IBOutlet weak var MoreProductImage1:UIImageView!
    
    @IBOutlet weak var MoreProductModelLabel1:UILabel!
    
    @IBOutlet weak var MoreProductPriceLabel1:UILabel!
    
    @IBOutlet weak var MoreProductImage2:UIImageView!
    
    @IBOutlet weak var MoreProductModelLabel2:UILabel!
    
    @IBOutlet weak var MoreProductPriceLabel2:UILabel!
    
    @IBOutlet weak var BrandsSegmentControl:UISegmentedControl!
    
    var products = [Product]()
    
    //var colors:[UIColor] = [#colorLiteral(red: 0.2392156863, green: 0.6980392157, blue: 1, alpha: 1),#colorLiteral(red: 0.3411764706, green: 0.8, blue: 0.6, alpha: 1),#colorLiteral(red: 0.07058823529, green: 0.3647058824, blue: 0.5960784314, alpha: 1),#colorLiteral(red: 0.4941176471, green: 0.7098039216, blue: 0.6509803922, alpha: 1),#colorLiteral(red: 0.7647058824, green: 0.4078431373, blue: 0.2235294118, alpha: 1)]
    let cart = CartService.instance
    
    let dataProduct = DataService.instance
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        products = dataProduct.NikeShoes
        
        
        loadMoreProducts()
        
        productsCollection.dataSource = self
        
        productsCollection.delegate = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath)
    -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as? ProductCell {
            
            let product = products[indexPath.row]
            
            cell.updateViews(product: product)
            
            cell.layer.cornerRadius = 12
            
            cell.addToCartButton.tag = indexPath.row
            
            cell.addToCartButton.addTarget(self, action: #selector(AddToCartBtnTapped), for: .touchUpInside)
            
            return cell
        }
        
        return ProductCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let product = products[indexPath.row]
        
            self.performSegue(withIdentifier: "listToDetails", sender: product)
        
    }
    
    @IBAction func unwindToProductsVC(segue:UIStoryboardSegue) {
        
    }
    
    @IBAction func CartButtonTapped(_ sender: Any) {
        
        performSegue(withIdentifier: "CartSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "listToDetails" {
            
            let detailProductVC = segue.destination as! DetailProductVC
            
            let product = sender as! Product

            detailProductVC.product = product
            
        } else if segue.identifier == "CartSegue" {
            
            let cartVC = segue.destination as! CartVC
            
            cartVC.cart = cart
        }
    }
    
    @objc func AddToCartBtnTapped(sender : UIButton){
        
        let indexPath = sender.tag

        let product = products[indexPath]
        
        cart.addProduct(product: product)
    }
    
    @IBAction func BrandsSegmentedControl(_ sender: Any) {
        
        let brands = BrandsSegmentControl.selectedSegmentIndex
        
        switch brands {
            
        case 0:
            
            products = dataProduct.NikeShoes
            
        case 1:
            
            products = dataProduct.AdidasShoes
            
        case 2:
            
            products = dataProduct.PumaShoes
            
        case 3:
            
            products = dataProduct.UnderArmourShoes
            
        default:
            break
        }
        
        loadMoreProducts()
        
        productsCollection.reloadData()
        
    }
    
    func loadMoreProducts(){
        
        guard  let product1 = products.randomElement(), let product2 = products.randomElement() else {return}
        
        MoreProductImage1.image = UIImage(named: product1.imageName)
        
        MoreProductModelLabel1.text = product1.model
        
        MoreProductPriceLabel1.text = "$\(product1.price)"
        
        MoreProductImage2.image = UIImage(named: product2.imageName)
        
        MoreProductModelLabel2.text = product2.model
        
        MoreProductPriceLabel2.text = "$\(product2.price)"
    }
    
}

extension ProductsVC:cellDelegate {
    func addCart(product: Product) {
        cart.addProduct(product: product)
    }
    
    
}


