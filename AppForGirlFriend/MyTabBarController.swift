//
//  MyTabBarController.swift
//  My Present
//
//  Created by Apple on 3/5/20.
//  Copyright © 2020 Hieu Le. All rights reserved.
//

import UIKit

class MyTabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // tell our UITabBarController subclass to handle its own delegate methods
        self.delegate = self
    }

    // called whenever a tab button is tapped
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {

        if viewController is FirstViewController {
            print("First tab")
        } else if viewController is SecondViewController {
            print("Second tab")
        }
    }
}