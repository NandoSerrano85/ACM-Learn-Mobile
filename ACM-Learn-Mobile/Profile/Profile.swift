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
//    var image: UIImage
    let typeList: [String] = ["Algorithms and DataStructure", "SQL", "Behavioural", "Product Design"]
    
    init(fname: String, lname: String, email: String, level: String, ranking: String, type: Int) {
        self.fname = fname
        self.lname = lname
        self.email = email
        self.level = level
        self.ranking = ranking
        self.type = typeList[type]
    }
}
