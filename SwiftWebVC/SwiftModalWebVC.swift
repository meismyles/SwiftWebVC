//
//  SwiftModalWebVC.swift
//
//  Created by Myles Ringle on 24/06/2015.
//  Transcribed from code used in SVWebViewController.
//  Copyright (c) 2015 Myles Ringle & Oliver Letterer. All rights reserved.
//

import UIKit

public class SwiftModalWebVC: UINavigationController {
    
    public enum SwiftModalWebVCTheme {
        case lightBlue, lightBlack, dark
    }
    public enum SwiftModalWebVCDismissButtonStyle {
        case arrow, cross
    }
    
    weak var webViewDelegate: UIWebViewDelegate? = nil
    
    public convenience init(urlString: String, sharingEnabled: Bool = true) {
        var urlString = urlString
        if !urlString.hasPrefix("https://") && !urlString.hasPrefix("http://") {
            urlString = "https://"+urlString
        }
        self.init(pageURL: URL(string: urlString)!, sharingEnabled: sharingEnabled)
    }
    
    public convenience init(urlString: String, theme: SwiftModalWebVCTheme, dismissButtonStyle: SwiftModalWebVCDismissButtonStyle, sharingEnabled: Bool = true) {
        self.init(pageURL: URL(string: urlString)!, theme: theme, dismissButtonStyle: dismissButtonStyle, sharingEnabled: sharingEnabled)
    }
    
    public convenience init(pageURL: URL, sharingEnabled: Bool = true) {
        self.init(request: URLRequest(url: pageURL), sharingEnabled: sharingEnabled)
    }
    
    public convenience init(pageURL: URL, theme: SwiftModalWebVCTheme, dismissButtonStyle: SwiftModalWebVCDismissButtonStyle, sharingEnabled: Bool = true) {
        self.init(request: URLRequest(url: pageURL), theme: theme, dismissButtonStyle: dismissButtonStyle, sharingEnabled: sharingEnabled)
    }
    
    public init(request: URLRequest, theme: SwiftModalWebVCTheme = .lightBlue, dismissButtonStyle: SwiftModalWebVCDismissButtonStyle = .arrow, sharingEnabled: Bool = true) {
        let webViewController = SwiftWebVC(aRequest: request)
        webViewController.sharingEnabled = sharingEnabled
        webViewController.storedStatusColor = UINavigationBar.appearance().barStyle
        
        let dismissButtonImageName = (dismissButtonStyle == .arrow) ? "SwiftWebVCDismiss" : "SwiftWebVCDismissAlt"
        let doneButton = UIBarButtonItem(image: SwiftWebVC.bundledImage(named: dismissButtonImageName),
                                         style: UIBarButtonItemStyle.plain,
                                         target: webViewController,
                                         action: #selector(SwiftWebVC.doneButtonTapped))
        
        switch theme {
        case .lightBlue:
            doneButton.tintColor = nil
            webViewController.buttonColor = nil
            webViewController.titleColor = UIColor.black
            UINavigationBar.appearance().barStyle = UIBarStyle.default
        case .lightBlack:
            doneButton.tintColor = UIColor.darkGray
            webViewController.buttonColor = UIColor.darkGray
            webViewController.titleColor = UIColor.black
            UINavigationBar.appearance().barStyle = UIBarStyle.default
        case .dark:
            doneButton.tintColor = UIColor.white
            webViewController.buttonColor = UIColor.white
            webViewController.titleColor = UIColor.groupTableViewBackground
            UINavigationBar.appearance().barStyle = UIBarStyle.black
        }
        
        if (UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad) {
            webViewController.navigationItem.leftBarButtonItem = doneButton
        }
        else {
            webViewController.navigationItem.rightBarButtonItem = doneButton
        }
        super.init(rootViewController: webViewController)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required public init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
    }
}
