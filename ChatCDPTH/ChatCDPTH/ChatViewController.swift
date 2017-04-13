//
//  ChatViewController.swift
//  ChatCDPTH
//
//  Created by Singh, Uttam on 4/13/17.
//  Copyright © 2017 codepath. All rights reserved.
//

import UIKit
import Parse

class ChatViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var chatText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func sendButtonTapped(_ sender: Any) {
        
        let chat = chatText.text!
        let message = PFObject(className: "Message")
        message["text"] = chat
        message.saveInBackground { (success:Bool, error:Error?) in
            if (success) {
               print(chat)
                
            } else {
               
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

}
