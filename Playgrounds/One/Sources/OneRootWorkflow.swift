import Workflow

public struct OneRootWorkflow: Workflow {
    public init() {}
}

extension OneRootWorkflow {
    public typealias Output = Never
}

extension OneRootWorkflow {

    public func makeInitialState() -> State {
        State()
    }

    public func workflowDidChange(from previousWorkflow: OneRootWorkflow, state: inout State) {
    }

}

extension OneRootWorkflow {
    public struct State {
    }
}

extension OneRootWorkflow {
    public typealias Rendering = OneView
    public func render(state: State, context: RenderContext<OneRootWorkflow>) -> OneView {
        OneView(text: "Hello")
    }
}
