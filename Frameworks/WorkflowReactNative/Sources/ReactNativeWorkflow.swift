import Workflow

public protocol Propable {
    var jsonRepresentation: [AnyHashable: Any] { get }
}

extension Propable where Self: Encodable {

    public var jsonRepresentation: [AnyHashable: Any] {
        let data = try! JSONEncoder().encode(self)
        return try! JSONSerialization.jsonObject(with: data, options: []) as! [AnyHashable: Any]
    }

}

public protocol ReactNativeWorkflow: Workflow where State == ReactNativeWorkflowState, Rendering == ReactNativeScreen {
    var jsBundleURL: URL { get }
    var moduleName: String { get }

    associatedtype Props: Propable

    var props: Props { get }
}

public struct AnyReactNativeWorkflow<Props: Propable>: ReactNativeWorkflow {

    public var jsBundleURL: URL
    public var moduleName: String
    public var props: Props

    public init(
        jsBundleURL: URL,
        moduleName: String,
        props: Props
    ) {
        self.jsBundleURL = jsBundleURL
        self.moduleName = moduleName
        self.props = props
    }

    public typealias Rendering = ReactNativeScreen

    public typealias Output = Never
}

public struct ReactNativeWorkflowState {
}

extension ReactNativeWorkflow {
    public func makeInitialState() -> State {
        ReactNativeWorkflowState()
    }

    public func workflowDidChange(from previousWorkflow: Self, state: inout State) {
    }

    public func render(state: State, context: RenderContext<Self>) -> Rendering {
        return ReactNativeScreen(
            jsBundleURL: jsBundleURL,
            moduleName: moduleName,
            props: props.jsonRepresentation
        )
    }
}
