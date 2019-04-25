//
//  PageViewController.swift
//  RxFlowBug
//
//  Created by Anton Nazarov on 25/04/2019.
//  Copyright © 2019 Anton Nazarov. All rights reserved.
//

import UIKit
import RxFlow

class PageViewController: UIPageViewController {
    let orderedViewControllers: [UIViewController & Stepper] = [
        UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as! ViewController,
        UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController2") as! ViewController2
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        setViewControllers([orderedViewControllers.first!], direction: .forward, animated: true)
    }
}

extension PageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return viewController == orderedViewControllers.last ? orderedViewControllers.first : nil
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return viewController == orderedViewControllers.first ? orderedViewControllers.last : nil
    }
}
