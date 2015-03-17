//
//  ViewController.swift
//  Nachrichten
//
//  Created by Yannik Ehlert on 09.01.15.
//  Copyright (c) 2015 Yannik Ehlert. All rights reserved.
//

import UIKit
import StoreKit

class ViewController: UIViewController,SKStoreProductViewControllerDelegate {
    var openappstore = false
    override func viewDidLoad() {
        super.viewDidLoad()
        var welt = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.size.width - 5, height: 50))
        welt.center = CGPoint(x: view.center.x, y: view.center.y - 100)
        welt.setTitle("Die Welt", forState: .Normal)
        welt.addTarget(self, action: "welt", forControlEvents: .TouchDown)
        welt.backgroundColor = .blackColor()
        welt.layer.cornerRadius = 5
        view.addSubview(welt)
        
        var faz = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.size.width - 5, height: 50))
        faz.center = CGPoint(x: view.center.x, y: view.center.y - 40)
        faz.setTitle("FAZ", forState: .Normal)
        faz.addTarget(self, action: "faz", forControlEvents: .TouchDown)
        faz.backgroundColor = .blackColor()
        faz.layer.cornerRadius = 5
        view.addSubview(faz)
        
        var gnews = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.size.width - 5, height: 50))
        gnews.center = CGPoint(x: view.center.x, y: view.center.y + 20)
        gnews.setTitle("Google News", forState: .Normal)
        gnews.addTarget(self, action: "gnews", forControlEvents: .TouchDown)
        gnews.backgroundColor = .blackColor()
        gnews.layer.cornerRadius = 5
        view.addSubview(gnews)
        
        var sz = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.size.width - 5, height: 50))
        sz.center = CGPoint(x: view.center.x, y: view.center.y + 80)
        sz.setTitle("Süddeutsche.de", forState: .Normal)
        sz.addTarget(self, action: "sz", forControlEvents: .TouchDown)
        sz.backgroundColor = .blackColor()
        sz.layer.cornerRadius = 5
        view.addSubview(sz)
        
        var appswitch = UISwitch(frame: CGRect(x: 0, y: 50, width: 60, height: 50))
        appswitch.center = CGPoint(x: view.center.x - 100, y: appswitch.center.y)
        appswitch.addTarget(self, action: "appstore", forControlEvents: .ValueChanged)
        if !UIApplication.sharedApplication().canOpenURL(NSURL(string: "itms-apps://")!) {
            appswitch.enabled = false
        }
        view.addSubview(appswitch)
        
        var applabel = UILabel(frame: CGRect(x: 60, y: 50, width: 200, height: 50))
        applabel.center = CGPoint(x: view.center.x + 40, y: appswitch.center.y)
        applabel.text = "Open App Store"
        view.addSubview(applabel)
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func appstore() {
        if openappstore {
            openappstore = false
        } else {
            openappstore = true
        }
    }
    @IBAction func sz() {
            if openappstore && UIApplication.sharedApplication().canOpenURL(NSURL(string: "itms-apps://")!) {
            openappstore("338711072")
        } else {
            UIApplication.sharedApplication().openURL(NSURL(string: "http://sueddeutsche.de")!)
        }
    }
    @IBAction func gnews() {
        if UIApplication.sharedApplication().canOpenURL(NSURL(string: "comgooglenews://")!) {
            UIApplication.sharedApplication().openURL(NSURL(string: "comgooglenews://")!)
        } else {
            if openappstore && UIApplication.sharedApplication().canOpenURL(NSURL(string: "itms-apps://")!) {
                openappstore("913753848")
            } else {
                UIApplication.sharedApplication().openURL(NSURL(string: "https://news.google.de")!)
            }
        }
    }
    @IBAction func welt() {
        if UIApplication.sharedApplication().canOpenURL(NSURL(string: "welt://")!) {
            UIApplication.sharedApplication().openURL(NSURL(string: "welt://")!)
        } else {
            if openappstore && UIApplication.sharedApplication().canOpenURL(NSURL(string: "itms-apps://")!) {
                openappstore("340021100")
            } else {
                UIApplication.sharedApplication().openURL(NSURL(string: "http://welt.de")!)
            }
        }
    }
    @IBAction func faz() {
        if UIApplication.sharedApplication().canOpenURL(NSURL(string: "fb616927995042097://")!) {
            UIApplication.sharedApplication().openURL(NSURL(string: "fb616927995042097://")!)
        } else {
            if openappstore && UIApplication.sharedApplication().canOpenURL(NSURL(string: "itms-apps://")!) {
                openappstore("375948652")
            } else {
                UIApplication.sharedApplication().openURL(NSURL(string: "http://faz.net")!)
            }
        }
    }
    func productViewControllerDidFinish(viewController: SKStoreProductViewController!) {
        viewController.dismissViewControllerAnimated(true, completion: nil)
    }
    func openappstore(id:String) {
        let controller = SKStoreProductViewController()
        controller.delegate = self
        controller.loadProductWithParameters([SKStoreProductParameterITunesItemIdentifier:id], completionBlock: nil)
        self.presentViewController(controller, animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

