//
//  SwiftWebVCActivityChrome.swift
//
//  Created by Myles Ringle on 24/06/2015.
//  Transcribed from code used in SVWebViewController.
//  Copyright (c) 2015 Myles Ringle & Sam Vermette. All rights reserved.
//

import UIKit

class SwiftWebVCActivityChrome : SwiftWebVCActivity {

    override func activityTitle() -> String {
        return NSLocalizedString("Open in Chrome", tableName: "SwiftWebVC", comment: "")
    }
    
    override func canPerformWithActivityItems(activityItems: [AnyObject]) -> Bool {
        for activityItem in activityItems {
            if activityItem .isKindOfClass(NSURL) && UIApplication.sharedApplication().canOpenURL(NSURL(string: "googlechrome://")!) {
                return true;
            }
        }
        return false;
    }
    
    override func performActivity() {
        let inputURL: NSURL! = URLToOpen
        let scheme: String! = inputURL.scheme
        
        // Replace the URL Scheme with the Chrome equivalent.
        var chromeScheme: String? = nil;
        if scheme == "http" {
            chromeScheme = "googlechrome"
        }
        else if scheme == "https" {
            chromeScheme = "googlechromes"
        }
        
        // Proceed only if a valid Google Chrome URI Scheme is available.
        if chromeScheme != nil {
            let absoluteString: NSString! = inputURL!.absoluteString
            let rangeForScheme: NSRange! = absoluteString.rangeOfString(":")
            let urlNoScheme: String! = absoluteString.substringFromIndex(rangeForScheme.location)
            let chromeURLString: String! = chromeScheme!+urlNoScheme
            let chromeURL: NSURL! = NSURL(string: chromeURLString)
            
            // Open the URL with Chrome.
            UIApplication.sharedApplication().openURL(chromeURL)
        }
    }
    
}