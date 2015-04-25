//
//  ProjectsViewController.swift
//  Andrew Clissold
//
//  Created by Andrew Clissold on 4/21/15.
//  Copyright (c) 2015 Andrew Clissold. All rights reserved.
//

import UIKit

class ProjectsViewController: UIViewController, UIPageViewControllerDataSource  {

    var pageViewController: UIPageViewController!

    var spamViewController: UIViewController!
    var oaklandPostViewController: UIViewController!
    var typeOneTwoViewController: UIViewController!

    override func viewDidLoad() {
        title = "Projects"
        setUpPageViewController()
    }

    func setUpPageViewController() {
        spamViewController = storyboard!.instantiateViewControllerWithIdentifier("SpamViewController") as! UIViewController
        oaklandPostViewController = storyboard!.instantiateViewControllerWithIdentifier("OaklandPostViewController") as! UIViewController
        typeOneTwoViewController = storyboard!.instantiateViewControllerWithIdentifier("TypeOneTwoViewController") as! UIViewController

        pageViewController = storyboard!.instantiateViewControllerWithIdentifier("PageViewController") as! UIPageViewController
        pageViewController.setViewControllers([spamViewController], direction: .Forward, animated: true, completion: nil)
        pageViewController.dataSource = self
        addChildViewController(pageViewController)
        view.addSubview(pageViewController.view)

        pageViewController.didMoveToParentViewController(self)
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }

    // MARK: UIPageViewControllerDataSource

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
