//
//  User.swift
//  Assignment1
//
//  Created by Thomas Sutlovic on 2018-10-19.
//  Copyright © 2018 ThomasSutlovic. All rights reserved.
//

import UIKit

class User: NSObject {
    
    var id: Int?
    var name: String?
    var address: String?
    var phoneNumber: String?
    var email: String?
    var age: Int?
    var gender: String?
    var avatar: Int?
    var dob: String?
    
    func initWithData(theID i: Int, theName n: String, theAddress ad: String, thePhoneNumber p: String, theEmail e: String, theAge a: Int, theGender g: String, theAvatar av: Int, theDOB d: String ){
        
        id = i
        name = n
        address = ad
        phoneNumber = p
        email = e
        age = a
        gender = g
        avatar = av
        dob = d
        
    }
}
