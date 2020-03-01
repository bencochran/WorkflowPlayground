import Workflow
import WorkflowUI

public struct TwoRootWorkflow: Workflow {
    public init() {}
}

extension TwoRootWorkflow {
    public typealias Output = Never
}

extension TwoRootWorkflow {

    public func makeInitialState() -> State {
        State()
    }

    public func workflowDidChange(from previousWorkflow: TwoRootWorkflow, state: inout State) {
    }

}

extension TwoRootWorkflow {
    public struct State {
    }
}

extension TwoRootWorkflow {
    public func render(state: State, context: RenderContext<TwoRootWorkflow>) -> some Screen {
        TwoScreen(text: "Hello")
    }
}
