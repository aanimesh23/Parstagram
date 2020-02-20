//
//  signUpViewController.swift
//  Parstagram
//
//  Created by Animesh Agrawal on 2/18/20.
//  Copyright © 2020 Animesh Agrawal. All rights reserved.
//

import UIKit
import Parse
class signUpViewController: UIViewController {

    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onSignUp(_ sender: Any) {
        let user = PFUser()
        user.username = usernameText.text
        user.password = passwordText.text
        user.email = emailText.text
        user["name"] = nameText.text
        
        user.signUpInBackground() {
            (success, error) in
            if success {
                self.performSegue(withIdentifier: "signedUp", sender: nil)
            }
            else {
                print("error is \(error)")
            }
        }
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
