//
//  CountryTableViewCell.swift
//  CountriesWithDelegate
//
//  Created by Uche Godfrey on 2023-09-05.
//

import UIKit

class CountryTableViewCell: UITableViewCell {

    @IBOutlet var capital: UILabel!
    @IBOutlet var currency: UILabel!
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
