//
//  ProjectsDataSource.swift
//  Andrew Clissold
//
//  Created by Andrew Clissold on 4/25/15.
//  Copyright (c) 2015 Andrew Clissold. All rights reserved.
//

import UIKit

class ProjectsDataSource: NSObject, UIPageViewControllerDataSource {

    var spamViewController: UIViewController!
    var oaklandPostViewController: UIViewController!
    var typeOneTwoViewController: UIViewController!

    var initialViewController: UIViewController! {
        return spamViewController
    }

    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 3
    }

    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }

    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        switch viewController {
        case spamViewController:
            return oaklandPostViewController
        case oaklandPostViewController:
            return typeOneTwoViewController
        case typeOneTwoViewController:
            return nil
        default:
            fatalError("unknown view controller")
        }
    }

    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        switch viewController {
        case spamViewController:
            return nil
        case oaklandPostViewController:
            return spamViewController
        case typeOneTwoViewController:
            return oaklandPostViewController
        default:
            fatalError("unknown view controller")
        }
    }

}
