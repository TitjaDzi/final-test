//
//  UserTableViewCell.swift
//  ComtradeGramFinal
//
//  Created by Tijana Gojkovic on 2/6/18.
//  Copyright © 2018 com.comtrade.Gram. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    
    //MARK: Outlets
    
    @IBOutlet weak var userPostProfileImg: UIImageView!
    @IBOutlet weak var userPostDescription: UITextView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        userPostProfileImg.layer.cornerRadius = userPostProfileImg.frame.size.width / 2
        userPostProfileImg.layer.masksToBounds = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
