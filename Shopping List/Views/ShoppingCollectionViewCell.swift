//
//  ShoppingCollectionViewCell.swift
//  Shopping List
//
//  Created by Lambda_School_Loaner_151 on 8/20/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingCollectionViewCell: UICollectionViewCell {
 //lowercase shoppingItem is the variable that is throwing to the cell (the quarterback) the cell is the receiver (who recives the pass or the function)
//we are now passing the shoppingItem over to the shoppingCollectionViewController
    var shoppingItem: Shopping? {
        didSet {
            updateViews()
        }
    }
    

    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var beenAddedLabel: UILabel!
   // the guard let is like a bouncer...if you have your id you can continue in (you can continue the code) if you dont have your id you can't continue and the code stops (you cant continue on with any logic
    func updateViews() {
        guard let shoppingItem = shoppingItem else {
            print("No shopping Label")
            return
        }
        //assigning the shoppingItem and its name to the textLabel
        //the if statement is going to run first, if it is true then it wont get to the else statement. If it is false, it will run the else statement. This is all within the update views scope
        // image is our variable and it is equal to our actual UIImage. the UIImage is
        // the image in our imageView is equal to the image (from our assets folder)
        textLabel.text = shoppingItem.name
        if shoppingItem.beenAdded == true {
            beenAddedLabel.text = "Added"
        } else {
            beenAddedLabel.text = "Not Added"
        }
        let image = UIImage(named: shoppingItem.name)
        imageView.image = image
    }

}


