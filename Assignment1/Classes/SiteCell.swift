//
//  SiteCell.swift
//  Assignment1
//
//  Created by Thomas Sutlovic on 2018-10-21.
//  Copyright © 2018 ThomasSutlovic. All rights reserved.
//

import UIKit

class SiteCell: UITableViewCell {
    
    let height : Int = 165
    
    let nameLabel = UILabel()
    let addressLabel = UILabel()
    let phoneLabel = UILabel()
    let emailLabel = UILabel()
    let ageLabel = UILabel()
    let genderLabel = UILabel()
    let dobLabel = UILabel()
    let avatarImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        nameLabel.textAlignment = .left
        nameLabel.font = UIFont.boldSystemFont(ofSize: 30)
        nameLabel.backgroundColor = UIColor.clear
        nameLabel.textColor = UIColor.black
        
        addressLabel.textAlignment = .left
        addressLabel.font = UIFont.boldSystemFont(ofSize: 16)
        addressLabel.backgroundColor = UIColor.clear
        addressLabel.textColor = UIColor.blue
        
        phoneLabel.textAlignment = .left
        phoneLabel.font = UIFont.boldSystemFont(ofSize: 16)
        phoneLabel.backgroundColor = UIColor.clear
        phoneLabel.textColor = UIColor.blue
        
        emailLabel.textAlignment = .left
        emailLabel.font = UIFont.boldSystemFont(ofSize: 16)
        emailLabel.backgroundColor = UIColor.clear
        emailLabel.textColor = UIColor.blue
        
        ageLabel.textAlignment = .left
        ageLabel.font = UIFont.boldSystemFont(ofSize: 16)
        ageLabel.backgroundColor = UIColor.clear
        ageLabel.textColor = UIColor.blue
        
        genderLabel.textAlignment = .left
        genderLabel.font = UIFont.boldSystemFont(ofSize: 16)
        genderLabel.backgroundColor = UIColor.clear
        genderLabel.textColor = UIColor.blue
        
        dobLabel.textAlignment = .left
        dobLabel.font = UIFont.boldSystemFont(ofSize: 16)
        dobLabel.backgroundColor = UIColor.clear
        dobLabel.textColor = UIColor.blue
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(nameLabel)
        contentView.addSubview(addressLabel)
        contentView.addSubview(phoneLabel)
        contentView.addSubview(emailLabel)
        contentView.addSubview(ageLabel)
        contentView.addSubview(genderLabel)
        contentView.addSubview(dobLabel)
        contentView.addSubview(avatarImageView)
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        
        var f = CGRect(x: 100, y: 5, width: 460, height: 30)
        nameLabel.frame = f
        
        f = CGRect(x: 100, y: 40, width: 460, height: 20)
        addressLabel.frame = f
        
        f = CGRect(x: 100, y: 65, width: 460, height: 20)
        phoneLabel.frame = f
        
        f = CGRect(x: 100, y: 90, width: 460, height: 20)
        emailLabel.frame = f
        
        f = CGRect(x: 100, y: 115, width: 460, height: 20)
        ageLabel.frame = f
        
        f = CGRect(x: 100, y: 140, width: 460, height: 20)
        genderLabel.frame = f
        
        f = CGRect(x: 100, y: 165, width: 460, height: 20)
        dobLabel.frame = f
        
        f = CGRect(x: 5, y: 5, width: 45, height: 45)
        avatarImageView.frame = f
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
