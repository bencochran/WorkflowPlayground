//
//  WrappingWorkflow.swift
//  WorkflowPlayground
//
//  Created by Ben Cochran on 2/29/20.
//  Copyright © 2020 Ben Cochran. All rights reserved.
//

import SwiftUI
import Workflow
import WorkflowSwiftUI
import WorkflowUI


struct WrappingWorkflow: Workflow {

    var wrapping: AnyWorkflow<AnyView, Never>

    init<W>(_ wrapping: W) where W: AnyWorkflowConvertible, W.Rendering: View, W.Output == Never {
        self.wrapping = wrapping.mapRendering(AnyView.init)
    }

    init<W>(_ wrapping: W) where W: AnyWorkflowConvertible, W.Rendering: Screen, W.Output == Never {
        self.wrapping = wrapping.mapRendering(ScreenView.init).mapRendering(AnyView.init)
    }

    func makeInitialState() -> Void { () }
    func workflowDidChange(from previousWorkflow: WrappingWorkflow, state: inout Void) { }

    func render(state: Void, context: RenderContext<WrappingWorkflow>) -> AnyView {
        return wrapping.rendered(with: context)
    }
}

extension WrappingWorkflow: View {
    var body: some View {
        WorkflowView(workflow: self)
    }
}
