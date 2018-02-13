//
//  CommentTableViewCell.swift
//  ComtradeGramFinal
//
//  Created by Tijana Gojkovic on 2/6/18.
//  Copyright © 2018 com.comtrade.Gram. All rights reserved.
//

import UIKit

class CommentTableViewCell: UITableViewCell {
    
    //MARK: Outlets
    
    @IBOutlet weak var userCommentProfileImg: UIImageView!
    @IBOutlet weak var userCommentText: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        userCommentProfileImg.layer.cornerRadius = userCommentProfileImg.frame.size.width / 2
        userCommentProfileImg.layer.masksToBounds = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
