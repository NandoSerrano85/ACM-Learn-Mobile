//
//  FeedViewCell.swift
//  ACM-Learn-Mobile
//
//  Created by Fernando Serrano on 12/3/19.
//  Copyright © 2019 FIU. All rights reserved.
//

import UIKit

class FeedViewCell: UITableViewCell, UITextFieldDelegate {
    
    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var username: UILabel!
    @IBOutlet var level: UILabel!
    @IBOutlet var type: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
