//
//  StudentTableViewCell.swift
//  StudentArray
//
//  Created by Quang Ly Hoang on 3/24/17.
//  Copyright © 2017 FenrirQ. All rights reserved.
//

import UIKit

class StudentTableViewCell: UITableViewCell {

    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
