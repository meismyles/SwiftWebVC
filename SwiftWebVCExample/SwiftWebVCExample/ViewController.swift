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
  }
  
  @IBAction func presentWithDefaultTheme()
  {
    let webVC = SwiftModalWebVC(urlString: "http://google.com")
    self.presentViewController(webVC, animated: true, completion: nil)
  }
    
  @IBAction func presentWithLightBlackTheme()
  {
    let webVC = SwiftModalWebVC(urlString: "http://google.com", theme: .lightBlack)
    self.presentViewController(webVC, animated: true, completion: nil)
  }
    
  @IBAction func presentWithDarkTheme()
  {
    let webVC = SwiftModalWebVC(urlString: "http://google.com", theme: .dark)
    self.presentViewController(webVC, animated: true, completion: nil)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

