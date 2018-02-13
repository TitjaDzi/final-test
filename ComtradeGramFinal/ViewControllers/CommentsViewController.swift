//
//  ViewController.swift
//  ComtradeGramFinal
//
//  Created by Predrag Jevtic on 1/10/18.
//  Copyright © 2018 com.comtrade.Gram. All rights reserved.
//

import UIKit
import SwiftInstagram

class CommentsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: Outlets
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var newCommentView: UIView!
    @IBOutlet weak var newCommentTxtField: UITextField!
    @IBOutlet weak var newCommentBtn: UIButton!
    
    
    var post: InstagramMedia? = nil
    var commentsList: [InstagramComment] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.newCommentBtn.layer.cornerRadius = 5
        self.newCommentBtn.layer.masksToBounds = true
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadComments()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: Table view functions
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return 1
        case 1:
            return commentsList.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return indexPath.section == 0 ? 120 : 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as! UserTableViewCell
            
            cell.userPostProfileImg.downloadedFrom(url: (post?.caption?.from.profilePicture)!)
            
            guard let username = post?.caption?.from.username else {
                return UITableViewCell()
            }
            guard let description = post?.caption?.text else {
                return UITableViewCell()
            }
            
            let user = NSAttributedString(string: username)
            let descriptionText = NSAttributedString(string: description)
            let userDescriptionText = user.mutableCopy() as! NSMutableAttributedString
            userDescriptionText.append(descriptionText)
            
            cell.userPostDescription.attributedText = userDescriptionText.copy() as! NSAttributedString
            
            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "commentCell", for: indexPath) as! CommentTableViewCell
            
            let comment = commentsList[indexPath.row]
            cell.userCommentProfileImg.downloadedFrom(url: comment.from.profilePicture)
            
            let user = NSAttributedString(string: "\(comment.from.username)")
            let contentText = NSAttributedString(string: " \(comment.text)")
            let userContentText = user.mutableCopy() as! NSMutableAttributedString
            userContentText.append(contentText)
            
            cell.userCommentText.attributedText = userContentText.copy() as! NSAttributedString
            
            return cell
            
        default:
            return UITableViewCell()
        }
    }
    
    //MARK: Actions
    
    func loadComments() {
        
        //load comments from Instagram
        
        Instagram.shared.comments(fromMedia: (self.post?.id)!, success: { apiComments in
            
            self.commentsList = apiComments
            self.tableView.reloadData()
            
        }, failure: { error in
            print(error.localizedDescription)
        })
    }
    
    @IBAction func sendComment(_ sender: Any) {
        
        //add comment on post
        
        Instagram.shared.createComment(onMedia: (self.post!.id), text: newCommentTxtField.text!, success: { newComment in
            
            self.commentsList.append(newComment)
            self.tableView.reloadData()
            self.newCommentTxtField.text = nil
            
        }, failure: { error in
            print(error.localizedDescription)
        })
    }
}


