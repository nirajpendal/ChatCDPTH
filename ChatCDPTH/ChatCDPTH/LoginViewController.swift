//
//  LoginViewController.swift
//  ChatCDPTH
//
//  Created by Singh, Uttam on 4/13/17.
//  Copyright © 2017 codepath. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {
    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func loginAction(_ sender: Any) {
    }

    @IBAction func signupAction(_ sender: Any) {
        
        var user = PFUser()
        user.username = userName.text
        user.password = userPassword.text
        user.email = userName.text
        
        
        user.signUpInBackground { (success: Bool, error) in
            print(error?.localizedDescription)
        }
    
//        user.signUpInBackgroundWithBlock {
//            (succeeded: Bool, error: NSError?) -> Void in
//            if let error = error {
//                let errorString = error.userInfo["error"] as? NSString
//                // Show the errorString somewhere and let the user try again.
//            } else {
//                // Hooray! Let them use the app now.
//            }
//        }
    }
}
