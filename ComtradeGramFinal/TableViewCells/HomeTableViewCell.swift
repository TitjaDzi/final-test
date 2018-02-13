//
//  HomeTableViewCell.swift
//  ComtradeGramFinal
//
//  Created by Tijana Gojkovic on 2/4/18.
//  Copyright © 2018 com.comtrade.Gram. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    //MARK: Outlets
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var usernameLbl: UILabel!
    @IBOutlet weak var locationLbl: UILabel!
    @IBOutlet weak var shareOpenBtn: UIButton!
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var likeLbl: UILabel!
    @IBOutlet weak var commentLbl: UILabel!
    @IBOutlet weak var commentBtn: UIButton!
    @IBOutlet weak var datePostLbl: UILabel!
    @IBOutlet weak var locationImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        profileImageView.layer.cornerRadius = profileImageView.frame.size.width / 2
        profileImageView.layer.masksToBounds = true
        
        usernameLbl.font = usernameLbl.font.withSize(14)
        
        locationLbl.font = usernameLbl.font.withSize(12)
        locationLbl.textColor = UIColor.lightGray
        
        likeLbl.font = likeLbl.font.withSize(14)
        likeLbl.textColor = UIColor.lightGray
        
        commentLbl.font = commentLbl.font.withSize(14)
        commentLbl.textColor = UIColor.lightGray
        
        datePostLbl.font = datePostLbl.font.withSize(12)
        datePostLbl.textColor = UIColor.lightGray
        
        layer.cornerRadius = 10
        clipsToBounds = true
        layer.borderWidth = 5
        layer.borderColor = UIColor.init(red: 236/255.0, green: 27/255.0, blue: 46/255.0, alpha: 1.0).cgColor
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
