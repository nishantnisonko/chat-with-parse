//
//  LoginViewController.swift
//  chat-with-parse
//
//  Created by Nishanko, Nishant on 4/12/17.
//  Copyright © 2017 Nishanko, Nishant. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signup(_ sender: Any) {
        print(userNameTextField.text!,passwordTextField.text!)
        let user = PFUser()
        user.username = userNameTextField.text!
        user.password = passwordTextField.text!
//        user.signUpInBackground(block: <#T##PFBooleanResultBlock?##PFBooleanResultBlock?##(Bool, Error?) -> Void#>)
        
        user.signUpInBackground { (succeeded, error) in
            if let error = error {
                let errorString = error.localizedDescription
                print(errorString)
                self.messageLabel.text = errorString
            } else {
                self.messageLabel.text = "Successfully signed in"
            }
        }
        
//        user.signUpInBackgroundWithBlock {
//            (succeeded: Bool, error: NSError?) -> Void in
//            
//        }
    }

    @IBAction func login(_ sender: Any) {
        PFUser.logInWithUsername(inBackground: userNameTextField.text!, password: passwordTextField.text!) { (user, error) in
            if user != nil {
                self.messageLabel.text = "logged in"
            } else {
                let errorString = error?.localizedDescription
                print(errorString)
                self.messageLabel.text = errorString
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
