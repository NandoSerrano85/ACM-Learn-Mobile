//
//  ProfileSentiment.swift
//  ACM-Learn-Mobile
//
//  Created by Fernando Serrano on 12/3/19.
//  Copyright © 2019 FIU. All rights reserved.
//

import UIKit

class ProfileSentiment: UIViewController {
    
    
    @IBOutlet var interestButtons: [UIButton]!
    @IBOutlet var skillLevelButtons: [UIButton]!
    @IBOutlet var finishedButton: UIButton!
    
    let typeList: [String] = ["Algorithms and DataStructure", "Behavioural", "Product Design"]
    let skillLevel: [Int] = [1,2,3,4]
    
    var auth: AuthAPI!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func interestPressed(_ sender: UIButton) {
        sender.backgroundColor = UIColor.blue
        
        for n in 0...3 {
            if n != sender.tag {
                interestButtons[n].alpha = 0.35
            }
            interestButtons[n].isEnabled = false
        }
    }
    
    @IBAction func skillLevelPressed(_ sender: UIButton) {
        sender.backgroundColor = UIColor.blue
        
        for n in 0...4 {
            if n != sender.tag {
                skillLevelButtons[n].alpha = 0.35
            }
            skillLevelButtons[n].isEnabled = false
        }
    }
    
    @IBAction func finishedPressed(_ sender: UIButton) {
        //create the new account
        self.performSegue(withIdentifier: "FeedView", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "FeedView" {
            segue.destination as! FeedViewController
        }
    }
}
