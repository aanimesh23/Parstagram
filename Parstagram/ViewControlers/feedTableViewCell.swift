//
//  feedTableViewCell.swift
//  Parstagram
//
//  Created by Animesh Agrawal on 2/19/20.
//  Copyright © 2020 Animesh Agrawal. All rights reserved.
//

import UIKit

class feedTableViewCell: UITableViewCell{

    @IBOutlet weak var photoPost: UIImageView!
    @IBOutlet weak var CaptionLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
