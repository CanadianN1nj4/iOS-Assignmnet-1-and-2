//
//  AppDelegate.swift
//  Assignment1
//
//  Created by Thomas Sutlovic on 2018-09-19.
//  Copyright © 2018 ThomasSutlovic. All rights reserved.
//

import UIKit
import SQLite3

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var databaseName : String? = "UserDatabase.db"
    var databasePath : String?
    var users : [User] = []
    var avatars = [#imageLiteral(resourceName: "Nyan"),#imageLiteral(resourceName: "Squid"),#imageLiteral(resourceName: "Trumpepe")]


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let documentPaths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        
        let documentsDir = documentPaths[0]
        
        databasePath = documentsDir.appending("/" + databaseName!)
        
        checkAndCreateDatabase()
        readDataFromDataBase()
        
        return true
    }
    
    func checkAndCreateDatabase(){
        
        var success = false
        let fileManager = FileManager.default
        
        success = fileManager.fileExists(atPath: databasePath!)
        
        if success{
            return
        }
        
        let databasePathFromApp = Bundle.main.resourcePath?.appending("/" + databaseName!)
        
        try? fileManager.copyItem(atPath: databasePathFromApp!, toPath: databasePath!)
        
    return;
    }

    func readDataFromDataBase() {
        users.removeAll()
        
        var db: OpaquePointer? = nil
        
        if sqlite3_open(self.databasePath, &db) == SQLITE_OK {
            print("Successfully opened conneciton to database at \(String(describing: self.databasePath))")
            
            var queryStatement: OpaquePointer? = nil
            let queryStatementString : String = "select * from users;"
        
            if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
                
                while ( sqlite3_step(queryStatement) == SQLITE_ROW) {
                    
                    let id: Int = Int(sqlite3_column_int(queryStatement, 0))
                    let cname = sqlite3_column_text(queryStatement, 1)
                    let caddress = sqlite3_column_text(queryStatement, 2)
                    let cphonenumber = sqlite3_column_text(queryStatement, 3)
                    let cemail = sqlite3_column_text(queryStatement, 4)
                    let age: Int = Int(sqlite3_column_int(queryStatement, 5))
                    let cGender = sqlite3_column_text(queryStatement, 6)
                    let avatar: Int = Int(sqlite3_column_int(queryStatement, 7))
                    let cdob = sqlite3_column_text(queryStatement, 8)
                    
                    let name = String(cString: cname!)
                    let address = String(cString: caddress!)
                    let phonenumber = String(cString: cphonenumber!)
                    let email = String(cString: cemail!)
                    let gender = String(cString: cGender!)
                    let dob = String(cString: cdob!)
                    
                    let user : User = User.init()
                    user.initWithData(theID: id, theName: name, theAddress: address, thePhoneNumber: phonenumber, theEmail: email, theAge: age, theGender: gender, theAvatar: avatar, theDOB: dob)
                    users.append(user)
                    
                    print("Query Result:")
                    print("\(id) | \(name) | \(address) | \(phonenumber) | \(email) | \(age) | \(gender) | \(avatar) | \(dob)")
                }
                
                sqlite3_finalize(queryStatement)
                
            } else {
               print("SELECET statement could not be prepared")
            }
            
            sqlite3_close(db)
            
        } else {
            print("Unable to open database")
        }
        
    }
    
    func insertIntoDatabase(user: User) -> Bool{
        
        var db: OpaquePointer? = nil
        var returnCode : Bool = true
        
        if sqlite3_open(self.databasePath, &db) == SQLITE_OK {
            print("Successfully opened conection to database!")
            
            var insertStatement : OpaquePointer? = nil
            let insertStatementString : String = "insert into users values(NULL, ?, ?, ?, ?, ?, ?, ?, ?)"
            
            if  sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
                
                
                let nameStr = user.name! as NSString
                let addressStr = user.address! as NSString
                let phoneStr = user.phoneNumber! as NSString
                let emailStr = user.email! as NSString
                let ageInt = Int32(user.age!)
                let genderStr = user.gender! as NSString
                let avatarInt = Int32(user.avatar!)
                let dobStr = user.dob! as NSString
                
                sqlite3_bind_text(insertStatement, 1, nameStr.utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 2, addressStr.utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 3, phoneStr.utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 4, emailStr.utf8String, -1, nil)
                sqlite3_bind_int(insertStatement, 5, ageInt)
                sqlite3_bind_text(insertStatement, 6, genderStr.utf8String, -1, nil)
                sqlite3_bind_int(insertStatement, 7, avatarInt)
                sqlite3_bind_text(insertStatement, 8, dobStr.utf8String, -1, nil)
                
                if sqlite3_step(insertStatement) == SQLITE_DONE {
                    let rowID = sqlite3_last_insert_rowid(db)
                    print("Successfully inserted row. \(rowID)")
                } else {
                    print("Could not insert row.")
                    returnCode = false
                }
                
                sqlite3_finalize(insertStatement)
                
            }else{
                print("INSERT statement could not be prepared")
                returnCode = false
            }
            
            sqlite3_close(db);
        }else {
            print("Unable to open database")
            returnCode = false
        }
        
        return returnCode
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

