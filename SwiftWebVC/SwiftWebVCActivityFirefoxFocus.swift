//
//  SwiftWebVCActivityFirefoxFocus.swift
//  SwiftWebVCExample
//
//  Created by Igor Kulman on 26/02/2018.
//  Copyright © 2018 Myles Ringle. All rights reserved.
//

import Foundation
import UIKit

class SwiftWebVCActivityFirefoxFocus : SwiftWebVCActivity {
    
    override var activityTitle : String {
        return NSLocalizedString("Open in Firefox Focus", tableName: "SwiftWebVC", comment: "")
    }
    
    override func canPerform(withActivityItems activityItems: [Any]) -> Bool {
        for activityItem in activityItems {
            if activityItem is URL, UIApplication.shared.canOpenURL(URL(string: "firefox-focus://")!) {
                return true;
            }
        }
        return false;
    }
    
    override func perform() {
        let inputURL: URL! = URLToOpen as URL!
        
        if let url = URL(string: "firefox-focus://open-url?url=\(inputURL.absoluteString)") {
            // Open the URL with Firefox Focus.
            UIApplication.shared.openURL(url)
        }
    }
    
}
