//
//  ProjectsViewController.swift
//  Andrew Clissold
//
//  Created by Andrew Clissold on 4/21/15.
//  Copyright (c) 2015 Andrew Clissold. All rights reserved.
//

import UIKit

class ProjectsViewController: UIViewController {

    var pageViewController: UIPageViewController!
    let dataSource = ProjectsDataSource()

    override func viewDidLoad() {
        title = "Projects"
        setUpPageViewController()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: "done:")
    }

    func done(sender: UIBarButtonItem) {
        navigationController?.performSegueWithIdentifier("unwindFromProjects", sender: self)
    }

    func setUpPageViewController() {
        dataSource.spamViewController = storyboard!.instantiateViewControllerWithIdentifier("SpamViewController") as! UIViewController
        dataSource.oaklandPostViewController = storyboard!.instantiateViewControllerWithIdentifier("OaklandPostViewController") as! UIViewController
        dataSource.typeOneTwoViewController = storyboard!.instantiateViewControllerWithIdentifier("TypeOneTwoViewController") as! UIViewController

        pageViewController = storyboard!.instantiateViewControllerWithIdentifier("ProjectsPageViewController") as! UIPageViewController
        pageViewController.setViewControllers([dataSource.initialViewController], direction: .Forward, animated: true, completion: nil)
        pageViewController.dataSource = dataSource
        addChildViewController(pageViewController)
        view.addSubview(pageViewController.view)

        pageViewController.didMoveToParentViewController(self)
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }

}
