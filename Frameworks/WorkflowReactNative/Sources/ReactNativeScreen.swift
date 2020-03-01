//
//  ReactNativeScreen.swift
//  WorkflowReactNative
//
//  Created by Ben Cochran on 2/29/20.
//

import React
import WorkflowUI


public struct ReactNativeScreen: Screen {
    public var jsBundleURL: URL
    public var moduleName: String
    public var props: [AnyHashable: Any]

    public var viewControllerDescription: ViewControllerDescription {
        return ViewControllerDescription(
            build: { ReactNativeViewController(screen: self) },
            update: { $0.update(screen: self) }
        )
    }
}

fileprivate final class ReactNativeViewController: UIViewController {

    private var jsBundleURL: URL
    private var moduleName: String
    private var props: [AnyHashable: Any]

    private var rootView: RCTRootView!

    init(screen: ReactNativeScreen) {
        jsBundleURL = screen.jsBundleURL
        moduleName = screen.moduleName
        props = screen.props
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        rootView = RCTRootView(
            bundleURL: jsBundleURL,
            moduleName: moduleName,
            initialProperties: props,
            launchOptions: nil
        )
        view = rootView
    }

    func update(screen: ReactNativeScreen) {
        jsBundleURL = screen.jsBundleURL
        moduleName = screen.moduleName
        props = screen.props

        guard isViewLoaded else { return }
        rootView.appProperties = props
    }

}
