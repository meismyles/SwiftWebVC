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
        let webVC = SwiftWebVC(urlString: "http://site.petitrc.com/reglages/yokomo/SetupSheetsYokomoBD8.html")
        webVC.delegate = self
        self.navigationController?.pushViewController(webVC, animated: true)
    }
    
    // MARK: Modal
    @IBAction func presentModalWithDefaultTheme() {
        let webVC = SwiftModalWebVC(urlString: "https://www.google.com")
        self.present(webVC, animated: true, completion: nil)
    }
    
    @IBAction func presentModalWithLightBlackTheme() {
        let webVC = SwiftModalWebVC(urlString: "https://www.google.com", theme: .lightBlack, dismissButtonStyle: .cross)
        self.present(webVC, animated: true, completion: nil)
    }
    
    @IBAction func presentModalWithDarkTheme() {
        let webVC = SwiftModalWebVC(urlString: "https://www.google.com", theme: .dark, dismissButtonStyle: .arrow)
        self.present(webVC, animated: true, completion: nil)
    }

}

extension ViewController: SwiftWebVCDelegate {
    
    func didStartLoading() {
        print("Started loading.")
    }
    
    func didFinishLoading(success: Bool) {
        print("Finished loading. Success: \(success).")
    }
}
