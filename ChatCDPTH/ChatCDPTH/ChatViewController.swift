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

    var messages:[String] = []
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var chatText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fetchMessages() {
        
    }
    
    
    @IBAction func sendButtonTapped(_ sender: Any) {
        
        let chat = chatText.text!
        let message = PFObject(className: "Message")
        message["text"] = chat
        message.saveInBackground { [weak self] (success:Bool, error:Error?) in
            if (success) {
               print(chat)
                
                self?.messages.append(chat)
                self?.tableView.reloadData()
                
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

extension ChatViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MessageCell", for: indexPath)
        
        cell.textLabel?.text = self.messages[indexPath.row]
        cell.textLabel?.numberOfLines = 0
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return  self.messages.count
    }
    
}
