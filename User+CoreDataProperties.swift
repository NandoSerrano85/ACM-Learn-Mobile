//
//  User+CoreDataProperties.swift
//  ACM-Learn-Mobile
//
//  Created by Fernando Serrano on 12/12/19.
//  Copyright © 2019 FIU. All rights reserved.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var appointment: NSDate?
    @NSManaged public var email: String?
    @NSManaged public var image: NSData?
    @NSManaged public var id: String?
    @NSManaged public var level: String?
    @NSManaged public var rank: String?
    @NSManaged public var type: String?

}
