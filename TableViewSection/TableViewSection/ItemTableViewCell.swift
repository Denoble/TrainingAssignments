//
//  ItemTableViewCell.swift
//  TableViewSection
//
//  Created by Uche Godfrey on 2023-08-31.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    @IBOutlet var label: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
