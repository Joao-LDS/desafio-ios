//
//  SceneDelegate.swift
//  desafio-ios
//
//  Created by João Luis Santos on 16/11/20.
//

import UIKit

@available(iOS 13.0, *)
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        let viewModel = APODTableViewModel()
        let controller = APODTableViewController(viewModel: viewModel)
        window = UIWindow(windowScene: scene)
        window?.rootViewController = controller
        window?.makeKeyAndVisible()
    }

}

