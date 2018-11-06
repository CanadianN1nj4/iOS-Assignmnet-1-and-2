//
//  AboutViewController.swift
//  Assignment1
//
//  Created by Thomas Sutlovic on 2018-09-23.
//  Copyright © 2018 ThomasSutlovic. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {
    
    let mainDelegate = UIApplication.shared.delegate as! AppDelegate

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        mainDelegate.readDataFromDataBase()
        
    }

}
