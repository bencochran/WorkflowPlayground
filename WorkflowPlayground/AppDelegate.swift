//
//  AppDelegate.swift
//  WorkflowPlayground
//
//  Created by Ben Cochran on 2/29/20.
//  Copyright © 2020 Ben Cochran. All rights reserved.
//

import SwiftUI
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let contentView = ContentView()

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UIHostingController(rootView: contentView)
        window?.makeKeyAndVisible()

        return true
    }

}

