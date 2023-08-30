//
//  ProductTableViewCell.swift
//  Networking
//
//  Created by Uche Godfrey on 2023-08-30.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    @IBOutlet var price: UILabel!
    @IBOutlet var imageUI: UIImageView!
    @IBOutlet var itemDescription: UITextView!
    @IBOutlet var title: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
