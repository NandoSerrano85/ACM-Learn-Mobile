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
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if let error = error, let _ = AuthErrorCode(rawValue: error._code) {
                print(error)
                return
            }
        }
        let uid = Auth.auth().currentUser?.uid
        let ref = Database.database().reference(fromURL: "https://acm-learn-mobile.firebaseio.com/")
        var values = ["fname": "", "lname": "", "email": "", "level": "", "ranking": "", "type": 0, "availability": ["Monday":["10am - 12pm"]]] as [String : Any]
        ref.child("users").child(uid!).observeSingleEvent(of: .value, with: { (snapshot: DataSnapshot) in
            print("using observer")
            if let dict = snapshot.value as? [String: Any] {
                values["fname"] = dict["firstName"] as? String
                values["lname"] = dict["lastName"] as? String
                values["email"] = dict["email"] as? String
                values["level"] = dict["level"] as? String
                values["ranking"] = dict["ranking"] as? String
                values["type"] = dict["type"] as? Int
                values["availability"] = dict["availability"] as? [String:[String]]
                
            }
        })
        
        return Profile(fname: values["fname"]! as! String, lname: values["lname"]! as! String , email: values["email"]! as! String , level: values["level"]! as! String , ranking: values["ranking"]! as! String , type: values["type"]! as! Int,  availability: values["availability"] as! [String:[String]])
        
    }
    
//    func registration(email: String, password: String, fname: String, lname: String) -> Profile {
//        profile = Profile(fname: "", lname: "", email: "", level: "", ranking: "")
//        return profile
//    }
}
