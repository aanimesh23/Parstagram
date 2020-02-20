//
//  LoginViewController.swift
//  Parstagram
//
//  Created by Animesh Agrawal on 2/15/20.
//  Copyright © 2020 Animesh Agrawal. All rights reserved.
//

import UIKit
import Parse
class LoginViewController: UIViewController {

    @IBOutlet weak var UsernameText: UITextField!
    @IBOutlet weak var PasswordText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onLogin(_ sender: Any) {
        PFUser.logInWithUsername(inBackground: UsernameText.text!, password: PasswordText.text!) {
            (user, error) in
            if user != nil {
                self.performSegue(withIdentifier: "LogInSegue", sender: nil)
            }
            else{
                print("Error: \(error)")
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
