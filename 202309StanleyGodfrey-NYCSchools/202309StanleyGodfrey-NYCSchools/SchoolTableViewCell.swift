//
//  SchoolTableCellTableViewCell.swift
//  202309StanleyGodfrey-NYCSchools
//
//  Created by Uche Godfrey on 9/10/23.
//

import UIKit

class SchoolTableViewCell: UITableViewCell {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var delete: UIButton!
    @IBOutlet weak var website: UILabel!
    @IBOutlet weak var location: UILabel!
    
   // var didDelete:( () -> () )?
    var didDelete: () -> ()  = { }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func deleteOnClick(_ sender: Any) {
        didDelete()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
