//
//  feedViewController.swift
//  Parstagram
//
//  Created by Animesh Agrawal on 2/15/20.
//  Copyright © 2020 Animesh Agrawal. All rights reserved.
//

import UIKit
import AlamofireImage
import Parse

class feedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var posts = [PFObject]()
    
    @IBOutlet weak var feedtable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        feedtable.delegate = self
        feedtable.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let query = PFQuery(className: "Posts")
        query.includeKey("author")
        query.limit = 20
        
        query.findObjectsInBackground { (posts, error) in
            if posts != nil {
                self.posts = posts!
                self.feedtable.reloadData()
            }
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = feedtable.dequeueReusableCell(withIdentifier: "feedTableViewCell") as! feedTableViewCell
        let post = posts[indexPath.row]
        
        
        let user = post["author"] as! PFUser
        cell.usernameLabel.text = user.username
        
        
        cell.CaptionLabel.text = post["Caption"] as! String
        
        let imagefile = post["image"] as! PFFileObject
        let urlstring = imagefile.url!
        let url = URL(string: urlstring)!
        print(url)
        cell.photoPost.af_setImage(withURL: url)
        
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
