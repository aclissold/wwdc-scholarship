//
//  BackgroundDataSource.swift
//  Andrew Clissold
//
//  Created by Andrew Clissold on 4/26/15.
//  Copyright (c) 2015 Andrew Clissold. All rights reserved.
//

import UIKit

class BackgroundDataSource: NSObject, UIPageViewControllerDataSource {

    var oaklandUniversityViewController: UIViewController!
    var IBMDesignViewController: UIViewController!
    var dominosViewController: UIViewController!

    var initialViewController: UIViewController {
        return oaklandUniversityViewController
    }

    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 3
    }

    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }

    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        switch viewController {
        case oaklandUniversityViewController:
            return IBMDesignViewController
        case IBMDesignViewController:
            return dominosViewController
        case dominosViewController:
            return nil
        default:
            fatalError("unknown view controller")
        }
        return nil
    }

    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        switch viewController {
        case oaklandUniversityViewController:
            return nil
        case IBMDesignViewController:
            return oaklandUniversityViewController
        case dominosViewController:
            return IBMDesignViewController
        default:
            fatalError("unknown view controller")
        }
    }

}
