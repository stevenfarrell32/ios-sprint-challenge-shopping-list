//
//  ShoppingItemsCollectionViewController.swift
//  Shopping List
//
//  Created by Lambda_School_Loaner_151 on 8/20/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit
import UserNotifications


class ShoppingItemsCollectionViewController: UICollectionViewController {
 
    let shoppingController = ShoppingController()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setupNavBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoppingController.myShoppingItems.count
    }
// THIS IS THE FUNCTION THAT IT IS CALLING TO UPDATE THE CELLS/VIEW
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShoppingCell", for: indexPath) as? ShoppingCollectionViewCell else {return UICollectionViewCell() }
   
        let shoppingItem = shoppingController.myShoppingItems[indexPath.item]
        cell.shoppingItem = shoppingItem
    
        return cell
    }
//this updates the label when the item is tapped
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let myItemBeenAdded = shoppingController.myShoppingItems[indexPath.item]
        print(myItemBeenAdded.name)
        shoppingController.updateBeenAdded(for: myItemBeenAdded)
        collectionView.reloadData()
    }
    // if the segue's identifier (street name) is equal to where we want to go, then it will perform the code
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowSegue" {
            guard let destinationViewController = segue.destination as? sendOrderViewController else { return }
            destinationViewController.shoppingController = shoppingController
        }
    }
 // the destinationViewController is my SendOrderViewController. This is where I want the information to go after my next button is selected in the first screen
    
}


