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
    var profile: Profile!
    
    var incomplete: [String:Any] = ["":""]
    var type:Int = 0
    var skill:String = ""
    var availability: [String:[String]] = ["":[""]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func interestPressed(_ sender: UIButton) {
        sender.backgroundColor = UIColor.blue
        skill = "Level " + String(sender.tag+1)
        for n in 0...2 {
            if n != sender.tag {
                interestButtons[n].alpha = 0.35
            }
            interestButtons[n].isEnabled = false
        }
    }
    
    @IBAction func skillLevelPressed(_ sender: UIButton) {
        sender.backgroundColor = UIColor.blue
        type = sender.tag
        for n in 0...3 {
            if n != sender.tag {
                skillLevelButtons[n].alpha = 0.35
            }
            skillLevelButtons[n].isEnabled = false
        }
    }
    
    @IBAction func finishedPressed(_ sender: UIButton) {
        //create the new account
        let nc = NotificationCenter.default
        nc.addObserver(self, selector: #selector(getDatTimeInfo), name: NSNotification.Name(rawValue: "availability"), object: nil)
        profile = auth.registration(fname: incomplete["fname"] as! String, lname: incomplete["lname"] as! String, email: incomplete["email"] as! String, password: incomplete["password"] as! String, image: incomplete["image"] as! UIImage, level: skill, ranking: "0", type: type, availability: availability)
        
        self.performSegue(withIdentifier: "FeedView", sender: self)
    }
    @objc func getDatTimeInfo(note:NSNotification){
        availability = note.userInfo as! [String:[String]]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "FeedView" {
            let feed = segue.destination as! FeedViewController
            feed.profile = self.profile
        }
    }
}
