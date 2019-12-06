//
//  Profile.swift
//  ACM-Learn-Mobile
//
//  Created by Fernando Serrano on 12/3/19.
//  Copyright © 2019 FIU. All rights reserved.
//

import Foundation

class Profile {
    var fname: String
    var lname: String
    var email: String
    var level: String
    var ranking: String
    var type: String
    var availability: [String:[String]]
//    var image: UIImage
    let daysAvailable: [String:[String]] = ["Monday":["10am - 12pm", "2pm-4pm", "6pm-8pm", "None"], "Tuesday":["10am - 12pm", "2pm-4pm", "6pm-8pm", "None"], "Wednesday":["10am - 12pm", "2pm-4pm", "6pm-8pm", "None"], "Thursday":["10am - 12pm", "2pm-4pm", "6pm-8pm", "None"], "Friday":["10am - 12pm", "2pm-4pm", "6pm-8pm", "None"]]
    let typeList: [String] = ["Algorithms and DataStructure", "Behavioural", "Product Design"]
    
    init(fname: String, lname: String, email: String, level: String, ranking: String, type: Int, availability: [String:[String]]) {
        self.fname = fname
        self.lname = lname
        self.email = email
        self.level = level
        self.ranking = ranking
        self.type = typeList[type]
        self.availability = availability
    }
}
