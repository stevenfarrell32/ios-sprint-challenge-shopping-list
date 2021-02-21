//
//  sendOrderViewController.swift
//  Shopping List
//
//  Created by Lambda_School_Loaner_151 on 8/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit



class sendOrderViewController: UIViewController {

    @IBOutlet weak var displayLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    var shoppingController: ShoppingController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    
    func updateViews() {
        guard let shoppingController = shoppingController else {
            print("Todd")
            return
        }
        displayLabel.text = ("Your order has \(shoppingController.beenAddedItems.count) items in your cart.")
        print("Peter")
    }
    
    @IBAction func sendOrder(_ sender: Any) {
        
        guard let name = nameTextField.text, let address = addressTextField.text else {
            return
        }
        let alertController = UIAlertController(title: "Thank you \(name) for your order", message: "You will receive your order at \(address)", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }

}

