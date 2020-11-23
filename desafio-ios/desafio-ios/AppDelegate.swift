//
//  AppDelegate.swift
//  desafio-ios
//
//  Created by João Luis Santos on 16/11/20.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let viewModel = APODTableViewModel()
        let controller = APODTableViewController(viewModel: viewModel)
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = controller
        window?.makeKeyAndVisible()
        return true
    }
    
}

