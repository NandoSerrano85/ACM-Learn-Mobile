//
//  ViewController.swift
//  ACM-Learn-Mobile
//
//  Created by Fernando Serrano on 11/19/19.
//  Copyright © 2019 FIU. All rights reserved.
//

import UIKit

class LandingViewController: UIViewController {

    @IBOutlet var signupButton: UIButton!
    @IBOutlet var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func registrationAction(_ sender: UIButton) {
        self.performSegue(withIdentifier: "RegistrationView", sender: self)
    }
    

    @IBAction func loginAction(_ sender: UIButton) {
        self.performSegue(withIdentifier: "LoginView", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "LoginView" {
            let loginViewController = segue.destination as! LoginViewController
            
        } else if segue.identifier == "RegistrationView" {
            let signupViewController = segue.destination as! RegistrationViewController
        }
    }
}

