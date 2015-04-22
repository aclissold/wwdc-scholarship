//
//  AppDelegate.swift
//  Andrew Clissold
//
//  Created by Andrew Clissold on 4/20/15.
//  Copyright (c) 2015 Andrew Clissold. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject : AnyObject]?) -> Bool {
        theme()
        return true
    }

    func theme() {
        let redColor = UIColor(red: 0xaa/0xff, green: 0, blue: 0, alpha: 1)
        let appearance = UINavigationBar.appearance()
        appearance.tintColor = redColor
        appearance.titleTextAttributes = [NSForegroundColorAttributeName: redColor,
            NSFontAttributeName: UIFont(name: "HelveticaNeue-Light", size: 17)!]
    }

}
