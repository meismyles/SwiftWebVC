//
//  ViewController.swift
//  SwiftWebVCExample
//
//  Created by Lucas Farah on 3/28/16.
//  Copyright © 2016 Lucas Farah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    let but = UIButton(frame: CGRect(x: 100, y: 100, width: 200, height: 100))
    but.setTitle("Open Google", forState: .Normal)
    but.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
    but.addTarget(self, action: #selector(ViewController.present), forControlEvents: .TouchUpInside)
    view.addSubview(but)
  }
  
  func present()
  {
    let webVC = SwiftModalWebVC(urlString: "http://google.com")
    self.presentViewController(webVC, animated: true, completion: nil)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

