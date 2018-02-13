//
//  ViewController.swift
//  ComtradeGramFinal
//
//  Created by Predrag Jevtic on 1/10/18.
//  Copyright © 2018 com.comtrade.Gram. All rights reserved.
//

import UIKit
import SwiftInstagram

class HomeViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    //MARK: Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    var instagramPosts: [InstagramMedia] = []
    var followingUser: [InstagramUser] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.loadPosts()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: Table view functions
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return instagramPosts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIndetifier = "cell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIndetifier, for: indexPath) as? HomeTableViewCell else {
            fatalError("The dequeued cell is not an instance of HomePageTableViewCell.")
        }
        
        let post = instagramPosts[indexPath.row]
        
        //MARK: Images
        
        cell.profileImageView.downloadedFrom(url: post.user.profilePicture)
        
        cell.postImageView.image = nil
        cell.postImageView.downloadedFrom(url: post.images.standardResolution.url, contentMode: .scaleAspectFill)
        
        //MARK: Labels
        
        cell.usernameLbl.text = post.user.username
        cell.locationLbl.text = post.location?.name
        
        cell.locationImg.isHidden = false
        if cell.locationLbl.text == nil {
            cell.locationImg.isHidden = true
        }
        
        cell.likeLbl.text = (post.likes.count) == 1 ? "\(post.likes.count) like" : "\(post.likes.count) likes"
        
        cell.commentLbl.text = (post.comments.count) == 1 ? "\(post.comments.count) comment" : "\(post.comments.count) comments"
        
        cell.datePostLbl.text = "\(post.createdDate.timeAgo())"
        
        //MARK: Buttons
        
        cell.commentBtn.tag = indexPath.row
        
        //MARK: TextView
        
        cell.descriptionTextView.text = post.caption?.text
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 450
    }
    
    //MARK: Actions
    
    func loadPosts(){
        
        //Loading posts from Instagram
        DispatchQueue.global(qos: .utility).async {
            Instagram.shared.recentMedia(fromUser: "self", count: 20, success: { mediaList in
                
                DispatchQueue.main.async(){
                    
                    self.instagramPosts = mediaList
                    self.tableView.reloadData()
                }
            }, failure: { error in
                print(error.localizedDescription)
            })
        }
    }
    
    @IBAction func addComments(_ sender: Any) {
        
        let post = self.instagramPosts[(sender as AnyObject).tag]
        self.performSegue(withIdentifier: "listComments", sender: post)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        switch(segue.identifier) {
        case "listComments"?:
            if let instPost = sender as? InstagramMedia {
                guard let commentsVC = segue.destination as? CommentsViewController
                    else {
                        return
                }
                commentsVC.post = instPost
            }
        default:
            print("some other segue")
        }
    }
    
    @IBAction func openProfile(_ sender: Any) {
        print("Open profile")
    }
    
    @IBAction func shareOpenBtn(_ sender: Any) {
        print("Open share")
    }
    
    @IBAction func openLocation(_ sender: Any) {
        print("Open location")
    }
    
    @IBAction func addLike(_ sender: Any) {
        print("Add like")
    }
    
    @IBAction func sharePostBtn(_ sender: Any) {
        print("Share post")
    }
    
}

extension Date {
    
    func timeAgo() -> String {
        
        let secondsAgo = Int(Date().timeIntervalSince(self))
        
        let minute = 60
        let hour = 60 * minute
        let day = 24 * hour
        let week = 7 * day
        
        if secondsAgo < minute {
            return "\(secondsAgo) seconds"
        } else if secondsAgo < hour {
            return "\(secondsAgo / minute) minutes"
        } else if secondsAgo < day {
            return "\(secondsAgo / hour) hours"
        } else if secondsAgo < week {
            return "\(secondsAgo / day) days"
        }
        return "\(secondsAgo / week) weeks"
    }
}




