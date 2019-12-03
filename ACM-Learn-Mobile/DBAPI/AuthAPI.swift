//
//  AuthAPI.swift
//  ACM-Learn-Mobile
//
//  Created by Fernando Serrano on 12/3/19.
//  Copyright © 2019 FIU. All rights reserved.
//

import Foundation
import FirebaseDatabase
import FirebaseAuth

class AuthAPI {
    
    var profile: Profile!
    
    func login(email:String, password:String) -> Profile {
        profile = Profile(fname: "", lname: "", email: "", level: "", ranking: "")
        return profile
    }
    
    func registration(email: String, password: String, fname: String, lname: String) -> Profile {
        profile = Profile(fname: "", lname: "", email: "", level: "", ranking: "")
        return profile
    }
}
