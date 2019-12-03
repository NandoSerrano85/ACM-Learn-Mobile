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
    
    init(fname: String, lname: String, email: String, level: String, ranking: String) {
        self.fname = fname
        self.lname = lname
        self.email = email
        self.level = level
        self.ranking = ranking
    }
}
