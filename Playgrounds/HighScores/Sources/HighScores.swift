//
//  HighScores.swift
//  HighScores
//
//  Created by Ben Cochran on 2/29/20.
//

import WorkflowReactNative
import Workflow

fileprivate struct Score: Encodable {
    var name: String
    var value: Int
}

fileprivate struct Props: Encodable, Propable {
    var scores: [Score]
}

public func highScoresWorkflow() -> AnyWorkflow<ReactNativeScreen, Never> {
    let url = URL(string: "http://localhost:8081/index.bundle?platform=ios")!
//    guard let url = Bundle.highScoresResources.url(forResource: "app", withExtension: "bundle") else {
//        fatalError("Unable to find app.bundle in \(Bundle.highScoresResources)")
//    }

    return AnyReactNativeWorkflow(
        jsBundleURL: url,
        moduleName: "RNHighScores",
        props: Props(
            scores: [
                Score(name: "Ben", value: 42),
                Score(name: "Jenny", value: 10),
            ]
        )
    ).asAnyWorkflow()
}
