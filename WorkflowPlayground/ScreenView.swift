//
//  ScreenView.swift
//  WorkflowPlayground
//
//  Created by Ben Cochran on 2/29/20.
//  Copyright © 2020 Ben Cochran. All rights reserved.
//

import SwiftUI
import WorkflowUI


struct ScreenView<S: Screen>: UIViewControllerRepresentable {

    var screen: S

    init(_ screen: S) {
        self.screen = screen
    }

    func makeUIViewController(context: UIViewControllerRepresentableContext<ScreenView<S>>) -> DescribedViewController {
        return DescribedViewController(screen: screen)
    }

    func updateUIViewController(_ uiViewController: DescribedViewController, context: UIViewControllerRepresentableContext<ScreenView<S>>) {
        uiViewController.update(screen: screen)
    }
}

