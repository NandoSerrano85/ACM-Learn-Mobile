//
//  UserCDInterface.swift
//  ACM-Learn-Mobile
//
//  Created by Fernando Serrano on 12/13/19.
//  Copyright © 2019 FIU. All rights reserved.
//
import UIKit
import CoreData

class UserCDInterface {
    let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "ACM-Learn-Mobile")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print("Error setting up Core Data (\(error)).")
            }
        }
        return container
    }()
    
    let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()
    
    func storeUser(_ profile: Profile) {
        self.persistentContainer.performBackgroundTask { (context) in
            print(context)
            
        }
    }
    
    func fetchUser(_ id: String) {
        
    }
    func saveContext() {
        try! self.persistentContainer.viewContext.save()
    }
}
