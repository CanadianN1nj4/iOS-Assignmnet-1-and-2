//
//  InputViewController.swift
//  Assignment1
//
//  Created by Thomas Sutlovic on 2018-09-23.
//  Copyright © 2018 ThomasSutlovic. All rights reserved.
//

import UIKit

class InputViewController: UIViewController, UITextFieldDelegate {
    
    let mainDelegate = UIApplication.shared.delegate as! AppDelegate
    
    //All the outlets for the text fields
    @IBOutlet var tfName : UITextField!
    @IBOutlet var tfAddress : UITextField!
    @IBOutlet var tfPhoneNumber : UITextField!
    @IBOutlet var tfEmail : UITextField!
    
    //the outlets for the age
    @IBOutlet var slAge : UISlider!
    @IBOutlet var lbAge : UILabel!
    
    //outlets for gender and avatar
    @IBOutlet var sgGender : UISegmentedControl!
    @IBOutlet var sgAvatar : UISegmentedControl!
    
    //outlet for datepicker
    @IBOutlet var dpDoB : UIDatePicker!
    
    //outlet for the submit button
    @IBOutlet var btnSubmit : UIButton!
    
    //action for when the form is submitted
    @IBAction func submittedForm( sender : UIButton){
        
        //creates variables for inputs
        let name : String = tfName.text!
        let address : String = tfAddress.text!
        let number : String = tfPhoneNumber.text!
        let email : String = tfEmail.text!
        let age : Int = Int(slAge.value)
        var gender: String
        let avatar : Int = sgAvatar.selectedSegmentIndex
        var dob : String
        
        //gets the right gender
        gender = sgGender.selectedSegmentIndex == 0 ? "Male" : "Female"
        
        //Sets up a date formatter
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        
        //formats the date properly into a string
        dob = dateFormatter.string(from: dpDoB.date)
        
        let msg = addUser(name: name, address: address, number: number, email: email, age: age, gender: gender, avatar: avatar, dob: dob)
        
        
        //creates an alert
        let alert = UIAlertController(title: "Submitted", message: "Thank you " + tfName.text! + " of " + tfEmail.text! + " for entering your data" + "\n" + msg , preferredStyle: .alert)
        
        //creates an action to say okay
        let okayAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
        
        //adds the action to the alert
        alert.addAction(okayAction)
        
        //presents the alert
        present(alert, animated: true)
        
    }

    //action for when the slider is changed
    @IBAction func sliderChanged( sender : UISlider){
        
        //age variable is the value of the slider
        let age = slAge.value
        //formats the value to a string with no decimals
        let strAge = String(format : "%.0f", age)
        //sets the label text to the value
        lbAge.text = strAge
        
    }
    
    func addUser(name : String, address : String, number : String, email : String, age : Int, gender : String, avatar : Int, dob : String) -> String{
        let user : User = User.init()
        user.initWithData(theID: 0, theName: name, theAddress: address, thePhoneNumber: number, theEmail: email, theAge: age, theGender: gender, theAvatar: avatar, theDOB: dob)
        
        let returnCode : Bool = mainDelegate.insertIntoDatabase(user: user)
        
        var returnMSG : String = "User Added"
        
        if returnCode == false{
            returnMSG = "User Add Failed"
        }
        return returnMSG
    }
    
    //makes sure the keyboard can close
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
