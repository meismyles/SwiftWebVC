//
//  SwiftWebVC.swift
//
//  Created by Myles Ringle on 24/06/2015.
//  Transcribed from code used in SVWebViewController.
//  Copyright (c) 2015 Myles Ringle & Sam Vermette. All rights reserved.
//

import UIKit

class SwiftWebVC: UIViewController, UIWebViewDelegate {
 
    weak var delegate: UIWebViewDelegate? = nil
    var storedStatusColor: UIBarStyle?
    var buttonColor: UIColor? = nil
    var titleColor: UIColor? = nil
    var closing: Bool! = false
    
    lazy var backBarButtonItem: UIBarButtonItem =  {
        var tempBackBarButtonItem = UIBarButtonItem(image: UIImage(named: "SwiftWebVC.bundle/SwiftWebVCBack"),
                                                    style: UIBarButtonItemStyle.Plain,
                                                    target: self,
                                                    action: Selector("goBackTapped:"))
        tempBackBarButtonItem.width = 18.0
        tempBackBarButtonItem.tintColor = self.buttonColor
        return tempBackBarButtonItem
    }()
    
    lazy var forwardBarButtonItem: UIBarButtonItem =  {
        var tempForwardBarButtonItem = UIBarButtonItem(image: UIImage(named: "SwiftWebVC.bundle/SwiftWebVCNext"),
                                                        style: UIBarButtonItemStyle.Plain,
                                                        target: self,
                                                        action: Selector("goForwardTapped:"))
        tempForwardBarButtonItem.width = 18.0
        tempForwardBarButtonItem.tintColor = self.buttonColor
        return tempForwardBarButtonItem
        }()
    
    lazy var refreshBarButtonItem: UIBarButtonItem = {
        var tempRefreshBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Refresh,
                                                        target: self,
                                                        action: Selector("reloadTapped:"))
        tempRefreshBarButtonItem.tintColor = self.buttonColor
        return tempRefreshBarButtonItem
    }()
    
    lazy var stopBarButtonItem: UIBarButtonItem = {
        var tempStopBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Stop,
                                                    target: self,
                                                    action: Selector("stopTapped:"))
        tempStopBarButtonItem.tintColor = self.buttonColor
        return tempStopBarButtonItem
    }()
    
    lazy var actionBarButtonItem: UIBarButtonItem = {
        var tempActionBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Action,
                                                    target: self,
                                                    action: Selector("actionButtonTapped:"))
        tempActionBarButtonItem.tintColor = self.buttonColor
        return tempActionBarButtonItem
    }()
    
    
    lazy var webView: UIWebView = {
        var tempWebView = UIWebView(frame: UIScreen.mainScreen().bounds)
        tempWebView.delegate = self;
        tempWebView.scalesPageToFit = true;
        return tempWebView;
    }()
    
    var request: NSURLRequest!
    
    var navBarTitle: UILabel!
    
    ////////////////////////////////////////////////
    
    deinit {
        webView.stopLoading()
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        webView.delegate = nil;
        delegate = nil;
    }
    
    convenience init(urlString: String) {
        self.init(pageURL: NSURL(string: urlString)!)
    }
    
    convenience init(pageURL: NSURL) {
        self.init(aRequest: NSURLRequest(URL: pageURL))
    }
    
    convenience init(aRequest: NSURLRequest) {
        self.init()
        self.request = aRequest
    }
    
    func loadRequest(request: NSURLRequest) {
        webView.loadRequest(request)
    }
    
    ////////////////////////////////////////////////
    // View Lifecycle
    
    override func loadView() {
        view = webView
        loadRequest(request)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateToolbarItems()
    }
    
    override func viewWillAppear(animated: Bool) {
        assert(self.navigationController != nil, "SVWebViewController needs to be contained in a UINavigationController. If you are presenting SVWebViewController modally, use SVModalWebViewController instead.")
        
        navBarTitle = UILabel()
        navBarTitle.backgroundColor = UIColor.clearColor()
        if presentingViewController == nil {
            let titleAttributes = navigationController!.navigationBar.titleTextAttributes! as NSDictionary
            navBarTitle.textColor = titleAttributes.objectForKey("NSColor")! as! UIColor
        }
        else {
            navBarTitle.textColor = self.titleColor
        }
        navBarTitle.shadowOffset = CGSizeMake(0, 1);
        navBarTitle.font = UIFont(name: "HelveticaNeue-Medium", size: 17.0)
        
        navigationItem.titleView = navBarTitle;
        
        super.viewWillAppear(true)
        
        if (UIDevice.currentDevice().userInterfaceIdiom == UIUserInterfaceIdiom.Phone) {
            self.navigationController?.setToolbarHidden(false, animated: false)
        }
        else if (UIDevice.currentDevice().userInterfaceIdiom == UIUserInterfaceIdiom.Pad) {
            self.navigationController?.setToolbarHidden(true, animated: true)
        }
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(true)
        
        if (UIDevice.currentDevice().userInterfaceIdiom == UIUserInterfaceIdiom.Phone) {
            self.navigationController?.setToolbarHidden(true, animated: true)
        }
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(true)
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
    }

    ////////////////////////////////////////////////
    // Toolbar
    
    func updateToolbarItems() {
        backBarButtonItem.enabled = webView.canGoBack
        forwardBarButtonItem.enabled = webView.canGoForward

    
        let refreshStopBarButtonItem: UIBarButtonItem = webView.loading ? stopBarButtonItem : refreshBarButtonItem
        
        let fixedSpace: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FixedSpace, target: nil, action: nil)
        let flexibleSpace: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)

        if (UIDevice.currentDevice().userInterfaceIdiom == UIUserInterfaceIdiom.Pad) {
    
            let toolbarWidth: CGFloat = 250.0
            fixedSpace.width = 35.0
    
            let items: NSArray = [fixedSpace, refreshStopBarButtonItem, fixedSpace, backBarButtonItem, fixedSpace, forwardBarButtonItem, fixedSpace, actionBarButtonItem]
    
            let toolbar: UIToolbar = UIToolbar(frame: CGRectMake(0.0, 0.0, toolbarWidth, 44.0))
            if !closing {
                toolbar.items = items as? [UIBarButtonItem]
                if presentingViewController == nil {
                    toolbar.barTintColor = navigationController!.navigationBar.barTintColor
                }
                else {
                    toolbar.barStyle = navigationController!.navigationBar.barStyle
                }
                toolbar.tintColor = navigationController!.navigationBar.tintColor
            }
            navigationItem.rightBarButtonItems = items.reverseObjectEnumerator().allObjects as? [UIBarButtonItem]

        }
        else {
            let items: NSArray = [fixedSpace, backBarButtonItem, flexibleSpace, forwardBarButtonItem, flexibleSpace, refreshStopBarButtonItem, flexibleSpace, actionBarButtonItem, fixedSpace]
    
            if !closing {
                if presentingViewController == nil {
                    navigationController!.toolbar.barTintColor = navigationController!.navigationBar.barTintColor
                }
                else {
                    navigationController!.toolbar.barStyle = navigationController!.navigationBar.barStyle
                }
                navigationController!.toolbar.tintColor = navigationController!.navigationBar.tintColor
                toolbarItems = items as? [UIBarButtonItem]
            }
        }
    }
    
    ////////////////////////////////////////////////
    // UIWebViewDelegate
    
    func webViewDidStartLoad(webView: UIWebView) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        updateToolbarItems()
    }
    
    
    func webViewDidFinishLoad(webView: UIWebView) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
    
        navBarTitle.text = webView.stringByEvaluatingJavaScriptFromString("document.title")
        navBarTitle.sizeToFit()
    
        updateToolbarItems()
    }
    
    func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        updateToolbarItems()
    }
    
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        return true;
    }

    
    ////////////////////////////////////////////////
    // Target Actions
    
    func goBackTapped(sender: UIBarButtonItem) {
        webView.goBack()
    }
    
    func goForwardTapped(sender: UIBarButtonItem) {
        webView.goForward()
    }
    
    func reloadTapped(sender: UIBarButtonItem) {
        webView.reload()
    }
    
    func stopTapped(sender: UIBarButtonItem) {
        webView.stopLoading()
        updateToolbarItems()
    }
    
    func actionButtonTapped(sender: AnyObject) {
        
        if let url: NSURL = ((webView.request?.URL != nil) ? webView.request?.URL : request.URL) {
            let activities: NSArray = [SwiftWebVCActivitySafari(), SwiftWebVCActivityChrome()]
    
            if url.absoluteString.hasPrefix("file:///") {
                let dc: UIDocumentInteractionController = UIDocumentInteractionController(URL: url)
                dc.presentOptionsMenuFromRect(view.bounds, inView: view, animated: true)
            }
            else {
                let activityController: UIActivityViewController = UIActivityViewController(activityItems: [url], applicationActivities: activities as? [UIActivity])
    
                if floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_7_1 && UIDevice.currentDevice().userInterfaceIdiom == UIUserInterfaceIdiom.Pad {
                    let ctrl: UIPopoverPresentationController = activityController.popoverPresentationController!
                    ctrl.sourceView = view
                    ctrl.barButtonItem = sender as? UIBarButtonItem
                }
    
                presentViewController(activityController, animated: true, completion: nil)
            }
        }
    }
    
    ////////////////////////////////////////////////
    
    func doneButtonTapped(sender: AnyObject) {
        closing = true
        UINavigationBar.appearance().barStyle = storedStatusColor!
        self.dismissViewControllerAnimated(true, completion: {})
    }
    
}