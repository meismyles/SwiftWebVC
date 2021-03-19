//
//  SwiftWebVCActivitySafari.swift
//
//  Created by Myles Ringle on 24/06/2015.
//  Transcribed from code used in SVWebViewController.
//  Copyright (c) 2015 Myles Ringle & Sam Vermette. All rights reserved.
//

import UIKit

class SwiftWebVCActivitySafari : SwiftWebVCActivity {
    
    override var activityTitle : String {
        return NSLocalizedString("Open in Safari", tableName: "SwiftWebVC", comment: "")
    }
    
    override func canPerform(withActivityItems activityItems: [Any]) -> Bool {
        for activityItem in activityItems {
            if let activityItem = activityItem as? URL, UIApplication.shared.canOpenURL(activityItem) {
                return true
            }
        }
        return false
    }
    
    override func perform() {
        
        guard let url = urlToOpen else {
            return
        }
        
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:]) { completed in
                self.activityDidFinish(completed)
            }
        }
    }
    
}
