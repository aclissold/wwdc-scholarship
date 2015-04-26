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
        let lightGrayColor = UIColor(white: 0.85, alpha: 1)
        let toolbarBackgroundColor = UIColor(red: 0xF5/0xFF, green: 0xF5/0xFF, blue: 0xF5/0xFF, alpha: 0.67)

        let navigationBarAppearance = UINavigationBar.appearance()
        navigationBarAppearance.tintColor = andrewClissoldRed
        navigationBarAppearance.titleTextAttributes = [NSForegroundColorAttributeName: andrewClissoldRed,
            NSFontAttributeName: UIFont(name: "HelveticaNeue-Light", size: 17)!]

        let pageControlAppearance = UIPageControl.appearance()
        pageControlAppearance.currentPageIndicatorTintColor = andrewClissoldRed
        pageControlAppearance.pageIndicatorTintColor = lightGrayColor
        pageControlAppearance.backgroundColor = toolbarBackgroundColor

        let barButtonItemApperance = UIBarButtonItem.appearance()
        barButtonItemApperance.tintColor = andrewClissoldRed
    }

}
