//
//  CartVC.swift
//  ShoeShock
//
//  Created by ioannis giannakidis on 1/9/21.
//

import UIKit

class CartVC: UIViewController,UITableViewDataSource,UITableViewDelegate,TableViewUpdater {
    
    
    
    
    @IBOutlet weak var  cartTableView : UITableView!
    
    @IBOutlet weak var totalItem: UILabel!
    
    @IBOutlet weak var totalCost:UILabel!
    
    @IBOutlet weak var checkOutButton:UIButton!
    
    var cart = CartService.instance
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        cartTableView.dataSource = self
        
        cartTableView.delegate = self
        
        checkItems()
        
        checkTotals()

    }
    
    func checkItems(){
        
        let  itemsInCart = cart.products.map{$0.quantity}.reduce(0,+)
        
        checkOutButton.isEnabled = cart.products.count > 0 ?  true : false
        
        if itemsInCart == 1 {
            
            totalItem.text = "Total \(itemsInCart) item"
            
        }else if itemsInCart > 1 {
            
            totalItem.text = "Total \(itemsInCart) items"
            
        }else {
            
            totalItem.text = "No items in cart"
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return cart.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CartCell") as? CartCell {
            
            let selectedproduct = cart.products[indexPath.row]
            
            cell.initCell(selProduct: selectedproduct)
            
            cell.delegate = self
            
            gettotal()
            
            return cell
            
        }else {
            
            return CartCell()
        }
    }
    
    func updateTableView() {
        
        checkTotals()
        
        checkItems()
        
        cartTableView.reloadData()
    }
    
    func gettotal() {
        
        totalCost.text = "$\(cart.getSubtotal())"
        
    }
    
    func checkTotals(){
        
        let total = cart.getSubtotal()
        
        if total == 0 {
            
            totalCost.text = "Nothing in cart"
            
        }
    }
    
    @IBAction func checkoutButtonPressed(_ sender: Any) {
        
        cart.clearCart()
        
        cartTableView.reloadData()
        
        checkItems()
        
        checkTotals()
    }
    
}
