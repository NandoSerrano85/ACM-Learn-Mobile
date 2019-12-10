//
//  AuthAPI.swift
//  ACM-Learn-Mobile
//
//  Created by Fernando Serrano on 12/3/19.
//  Copyright © 2019 FIU. All rights reserved.
//

import Foundation
import UIKit
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
    
    func registration(fname: String, lname: String, email: String, password: String, image: UIImage, level: String, ranking: String, type: Int, availability: [String:[String]]) -> Profile {
        
        Auth.auth().createUser(withEmail: email, password: password, completion: { (user, error) in
            if error != nil {
                print(error!)
                return
            }
//            let refStorage = Storage.storage().reference(fromURL: "https://acm-learn-mobile.firebaseio.com/")
//            let imageName = fname + lname + ".png"
//            let imageRef = ref.child("images").child(imageName)
//            
//            if let uploadImage = image.pngData(){
//                imageRef.putData(uploadImage, metadata: nil, completion: {(metadata, error) in
//                    if error != nil {
//                        print(error)
//                        return
//                    }
//                })
//            }
            
            let refDatabase = Database.database().reference(fromURL: "https://acm-learn-mobile.firebaseio.com/")
            let usersRef = refDatabase.child("users").child(user!.user.uid)
            let values = ["firstName":fname, "lastName":lname, "email":email, "image":"stuff", "level":level, "rank":ranking, "type":type, "availability":availability] as [String : Any]
            usersRef.setValue(values, withCompletionBlock: { (err, ref) in
                if err != nil {
                    print(err!)
                    return
                }
                print("Added new user")
            })
        })
        profile = Profile(fname: fname, lname: lname, email: email, image: image, level: level, ranking: ranking, type: type, availability: availability)
            

        return profile
    }
}
