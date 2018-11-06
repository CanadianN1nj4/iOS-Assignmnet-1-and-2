//
//  WebViewController.swift
//  Assignment1
//
//  Created by Thomas Sutlovic on 2018-09-23.
//  Copyright © 2018 ThomasSutlovic. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate {

    //The outlets for the webview and activity indicator
    @IBOutlet var webView : WKWebView!
    @IBOutlet var activity : UIActivityIndicatorView!
    
    //unhides the activity indicator and animates if navigation starts
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        activity.isHidden = false
        activity.startAnimating()
    }
    
    //hides the activity indicator and stops animation if navigation finishes
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activity.isHidden = true
        activity.stopAnimating()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //sets imgur to the url and loads
        let urlAdress = URL(string: "https://imgur.com")
        let url = URLRequest(url: urlAdress!)
        webView?.load(url)
        
        //sets the deligate for webView to this controller
        webView.navigationDelegate = self
    }


}
