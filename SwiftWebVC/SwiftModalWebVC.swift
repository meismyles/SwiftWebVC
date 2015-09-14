//
//  SwiftModalWebVC.swift
//
//  Created by Myles Ringle on 24/06/2015.
//  Transcribed from code used in SVWebViewController.
//  Copyright (c) 2015 Myles Ringle & Oliver Letterer. All rights reserved.
//

import UIKit

class SwiftModalWebVC: UINavigationController {
    
    weak var webViewDelegate: UIWebViewDelegate? = nil
    var webViewController: SwiftWebVC!
    
    convenience init(urlString: String) {
        self.init(pageURL: NSURL(string: urlString)!, theme: "Light-Blue")
    }
    
    convenience init(urlString: String, theme: String) {
        self.init(pageURL: NSURL(string: urlString)!, theme: theme)
    }
    
    convenience init(pageURL: NSURL) {
        self.init(request: NSURLRequest(URL: pageURL), theme: "Light-Blue")
    }
    
    convenience init(pageURL: NSURL, theme: String) {
        self.init(request: NSURLRequest(URL: pageURL), theme: theme)
    }
    
    init(request: NSURLRequest, theme: String) {
        webViewController = SwiftWebVC(aRequest: request)
        webViewController.storedStatusColor = UINavigationBar.appearance().barStyle
        let doneButton = UIBarButtonItem(image: UIImage(named: "SwiftWebVC.bundle/SwiftWebVCDismiss"),
                                         style: UIBarButtonItemStyle.Plain,
                                         target: webViewController,
                                         action: Selector("doneButtonTapped:"))
        
        switch theme {
        case "Light-Black":
            doneButton.tintColor = UIColor.darkGrayColor()
            webViewController.buttonColor = UIColor.darkGrayColor()
            webViewController.titleColor = UIColor.blackColor()
            UINavigationBar.appearance().barStyle = UIBarStyle.Default
        case "Dark":
            doneButton.tintColor = UIColor.whiteColor()
            webViewController.buttonColor = UIColor.whiteColor()
            webViewController.titleColor = UIColor.groupTableViewBackgroundColor()
            UINavigationBar.appearance().barStyle = UIBarStyle.Black
        default:
            doneButton.tintColor = nil
            webViewController.buttonColor = nil
            webViewController.titleColor = UIColor.blackColor()
            UINavigationBar.appearance().barStyle = UIBarStyle.Default
        }
        
        if (UIDevice.currentDevice().userInterfaceIdiom == UIUserInterfaceIdiom.Pad) {
            webViewController.navigationItem.leftBarButtonItem = doneButton
        }
        else {
            webViewController.navigationItem.rightBarButtonItem = doneButton
        }
        super.init(rootViewController: webViewController)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
 
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(false)
    }

}
