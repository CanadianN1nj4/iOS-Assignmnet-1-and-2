//
//  DataViewController.swift
//  Assignment1
//
//  Created by Thomas Sutlovic on 2018-10-21.
//  Copyright © 2018 ThomasSutlovic. All rights reserved.
//

import UIKit

class DataViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{
    
    let mainDelegate = UIApplication.shared.delegate as! AppDelegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainDelegate.users.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 190
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let tableCell = tableView.dequeueReusableCell(withIdentifier: "cell") as?
        SiteCell ?? SiteCell(style: .default, reuseIdentifier: "cell")
        
        let rowNum = indexPath.row
        
        tableCell.nameLabel.text = "Name: \(String(describing: mainDelegate.users[rowNum].name ?? "No Name" ))"
        
        tableCell.addressLabel.text = "Address: \(String(describing: mainDelegate.users[rowNum].address ?? "No Address" ))"
        
        tableCell.phoneLabel.text = "Phone: \(String(describing: mainDelegate.users[rowNum].phoneNumber ?? "No Phone" ))"
        
        tableCell.emailLabel.text = "Email: \(String(describing: mainDelegate.users[rowNum].email ?? "No Email" ))"
        
        tableCell.ageLabel.text = "Age: \(String(describing: mainDelegate.users[rowNum].age ?? 0 ))"
        
        tableCell.genderLabel.text = "Gender: \(String(describing: mainDelegate.users[rowNum].gender ?? "No Gender" ))"
        
        tableCell.dobLabel.text = "Date of Birth: \(String(describing: mainDelegate.users[rowNum].dob ?? "No Date of Birth" ))"
        
        tableCell.avatarImageView.image = mainDelegate.avatars[mainDelegate.users[rowNum].avatar!]
        
        tableCell.accessoryType = .disclosureIndicator
        
        
        return tableCell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        mainDelegate.readDataFromDataBase()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
