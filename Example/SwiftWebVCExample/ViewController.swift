//
//  ViewController.swift
//  SwiftWebVCExample
//
//  Created by Myles Ringle on 20/12/2016.
//  Copyright © 2016 Myles Ringle. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: Push
    @IBAction func push() {
        let webVC = SwiftWebVC(urlString: "https://www.google.com")
        self.navigationController?.pushViewController(webVC, animated: true)
    }
    
    // MARK: Modal
    @IBAction func presentModalWithDefaultTheme() {
        let webVC = SwiftModalWebVC(urlString: "https://www.google.com")
        self.present(webVC, animated: true, completion: nil)
    }
    
    @IBAction func presentModalWithLightBlackTheme() {
        let webVC = SwiftModalWebVC(urlString: "https://www.google.com", theme: .lightBlack)
        self.present(webVC, animated: true, completion: nil)
    }
    
    @IBAction func presentModalWithDarkTheme() {
        let webVC = SwiftModalWebVC(urlString: "https://www.google.com", theme: .dark)
        self.present(webVC, animated: true, completion: nil)
    }

}

