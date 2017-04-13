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
    
    @IBOutlet weak var pwdlabel: UITextField!
    @IBOutlet weak var userNameLabel: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func displayAlertWithMessage(title: String, message:String) {
        
        let alertView = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertView.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        present(alertView, animated: true, completion: nil)
        
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        
        guard let username = userNameLabel.text else {
            return
        }
        
        guard let pwd = pwdlabel.text else {
            return
        }
        
        PFUser.logInWithUsername(inBackground: username, password:pwd) { (user:PFUser?, error:Error?) in
            if user != nil {
                // Do stuff after successful login.
                print("Success Login")
            } else {
               self.displayAlertWithMessage(title: "Login", message: (error?.localizedDescription)!)
                print("Failed Login")
                // The login failed. Check error to see why.
            }
        }
    }
    
    @IBAction func signUpButtonTapped(_ sender: Any) {
        print("Sign Up")
        
        let user = PFUser()
        user.username = userNameLabel.text
        user.password = pwdlabel.text
        user.email = userNameLabel.text
        
        
        user.signUpInBackground { (success: Bool, error) in
            
            if success {
                
            } else {
                self.displayAlertWithMessage(title: "Sign Up", message: (error?.localizedDescription)!)
            }
            

        }
        
        
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    //    @IBAction func loginAction(_ sender: Any) {
    //    }
    //
    //    @IBAction func signupAction(_ sender: Any) {
    //
    //        var user = PFUser()
    //        user.username = userName.text
    //        user.password = userPassword.text
    //        user.email = userName.text
    //
    //
    //        user.signUpInBackground { (success: Bool, error) in
    //            print(error?.localizedDescription)
    //        }
    //
    ////        user.signUpInBackgroundWithBlock {
    ////            (succeeded: Bool, error: NSError?) -> Void in
    ////            if let error = error {
    ////                let errorString = error.userInfo["error"] as? NSString
    ////                // Show the errorString somewhere and let the user try again.
    ////            } else {
    ////                // Hooray! Let them use the app now.
    ////            }
    ////        }
    //    }
}
