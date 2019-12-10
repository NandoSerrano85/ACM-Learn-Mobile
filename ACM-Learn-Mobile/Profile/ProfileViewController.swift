//
//  ProfileViewController.swift
//  ACM-Learn-Mobile
//
//  Created by Fernando Serrano on 12/3/19.
//  Copyright © 2019 FIU. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    
    @IBOutlet var editMode: UIBarButtonItem!
    @IBOutlet var ProfileEditable: UIView!
    
    @IBOutlet var ProfileView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        ProfileView.alpha = 1
        ProfileEditable.alpha = 0
    }
    
    @IBAction func editModeTapped(_ sender: UIBarButtonItem) {
        ProfileView.alpha = 0
        ProfileEditable.alpha = 1
    }
    
}
