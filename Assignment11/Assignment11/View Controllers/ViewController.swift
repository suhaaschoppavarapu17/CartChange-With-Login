//
//  ViewController.swift
//  Assignment11
//
//  Created by Suhaas Choppavarapu on 9/3/20.
//  Copyright © 2020 Suhaas Choppavarapu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK:- IBOutlets
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    //MARK:- View Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.backgroundColor = .lightGray
        view.backgroundColor = UIColor(red: 0.48, green: 0.62, blue: 0.62, alpha: 1.00)
    }
    
    //MARK:- IBAction
    @IBAction func loginButtonTapped(_ sender: Any) {
        
        let username = usernameTextField.text
        let password = passwordTextField.text
        
        if username ==  "" && password == ""  {
            let alertController = UIAlertController(title: "Error",
                                                    message: "Please enter Your Credentials",
                                                    preferredStyle: UIAlertController.Style.alert)
            let alertAction = UIAlertAction(title: "OK",
                                            style: UIAlertAction.Style.cancel, handler: nil)
            alertController.addAction(alertAction)
            present(alertController, animated: true, completion: nil)
            return
        }
        if username != "suhaas" {
            let alertController = UIAlertController(title: "Login Failed",
                                                    message: "Please enter valid Username",
                                                    preferredStyle: UIAlertController.Style.alert)
            let alertAction = UIAlertAction(title: "OK",
                                            style: UIAlertAction.Style.cancel, handler: nil)
            alertController.addAction(alertAction)
            present(alertController, animated: true, completion: nil)
            
        } else if password != "suhaas"{
            let alertController = UIAlertController(title: "Login Failed",
                                                    message: "Please enter valid Password",
                                                    preferredStyle: UIAlertController.Style.alert)
            let cancelAction = UIAlertAction(title: "OK",
                                             style: UIAlertAction.Style.cancel, handler: nil)
            alertController.addAction(cancelAction)
            present(alertController, animated: true, completion: nil)
        }
        usernameTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        
        performSegue(withIdentifier: "firstSegue", sender: nil)
    }
}
