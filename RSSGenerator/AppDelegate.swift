//
//  AppDelegate.swift
//  RSSGenerator
//
//  Created by Nhan Nguyen on 7/15/19.
//  Copyright © 2019 Nhan Nguyen. All rights reserved.
//  nhannguyenit.work@gmail.com

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var navController: UINavigationController!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        
        let listViewController = ListViewController()
        listViewController.title = "Album"
        navController = UINavigationController(rootViewController: listViewController)
        navController.navigationBar.prefersLargeTitles = true
        
        window!.rootViewController = navController
        window!.makeKeyAndVisible()
        
        return true
    }
}

