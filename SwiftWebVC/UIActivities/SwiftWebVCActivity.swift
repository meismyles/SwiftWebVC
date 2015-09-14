//
//  SwiftWebVCActivity.swift
//
//  Created by Myles Ringle on 24/06/2015.
//  Transcribed from code used in SVWebViewController.
//  Copyright (c) 2015 Myles Ringle & Sam Vermette. All rights reserved.
//

import UIKit


class SwiftWebVCActivity: UIActivity {

    var URLToOpen: NSURL?
    var schemePrefix: String?
    
    override func activityType() -> String {
        return "\(self.dynamicType)"
    }
        
    override func activityImage() -> UIImage {
        let typeArray: NSArray = activityType().componentsSeparatedByString(".")
        let type: String = typeArray[typeArray.count-1] as! String
        if (UIDevice.currentDevice().userInterfaceIdiom == UIUserInterfaceIdiom.Pad) {
            return UIImage(named: type+"-iPad")!
        }
        else {
            return UIImage(named: type)!
        }
    }
            
    override func prepareWithActivityItems(activityItems: [AnyObject]) {
        for activityItem in activityItems {
            if activityItem .isKindOfClass(NSURL) {
                URLToOpen = activityItem as? NSURL
            }
        }
    }

}