//
//  SwiftWebVCActivityChrome.swift
//
//  Created by Myles Ringle on 24/06/2015.
//  Transcribed from code used in SVWebViewController.
//  Copyright (c) 2015 Myles Ringle & Sam Vermette. All rights reserved.
//

import UIKit

class SwiftWebVCActivityChrome : SwiftWebVCActivity {

    override var activityTitle : String {
        return NSLocalizedString("Open in Chrome", tableName: "SwiftWebVC", comment: "")
    }
    
    override func canPerform(withActivityItems activityItems: [Any]) -> Bool {
        for activityItem in activityItems {
            if activityItem is URL, UIApplication.shared.canOpenURL(URL(string: "googlechrome://")!) {
                return true;
            }
        }
        return false;
    }
    
    override func perform() {
        
        guard let url = urlToOpen else {
            return
        }
         
        var urlString = url.absoluteString
        
        let httpScheme = "http"
        
        if urlString.hasPrefix(httpScheme) {
            urlString = String(urlString.dropFirst(httpScheme.count))
        }
        
        guard let currentUrl = URL(string: urlString) else {
            return
        }
        
        if UIApplication.shared.canOpenURL(currentUrl) {
            UIApplication.shared.open(currentUrl, options: [:], completionHandler: nil)
        }
    }
    
}
