//
//  CountryTableViewCell.swift
//  Countries
//
//  Created by Uche Godfrey on 2023-09-02.
//

import UIKit

class CountryTableViewCell: UITableViewCell {
  
 
    @IBOutlet var currency: UILabel!
    
    @IBOutlet var capital: UILabel!
    
  
    @IBOutlet var country: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
